/*
* Copyright 2020 Ryo Nakano
*
* This program or library is free software; you can redistribute it
* and/or modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 3 of the License, or (at your option) any later version.
*
* This library is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this library. If not, see <https://www.gnu.org/licenses/>.
*/

namespace ChCase {

    /**
    * Case Converter.
    *
    * Set the case for input string and result string and then perform conversion.
    *
    * Example:
    *
    * {{{
    *   var converter = new ChCase.Converter.with_case (ChCase.Case.SPACE_SEPARATED, ChCase.Case.CAMEL);
    *   string input_text = "say hello to ChCase";
    *   string output_text = converter.convert_case (input_text);
    * }}}
    */
    public class Converter : GLib.Object {

        /**
         * Currently specified and expected case as representing input text.
         * 
         * @since 1.1.0
         */
        public Case source_case {
            get {
                return _source_case;
            }
            set {
                _source_case = value;
                _source_case_name = value.to_string ();
            }
        }
        private Case _source_case;

        /**
         * Currently specified case for output text.
         */
        public Case result_case {
            get {
                return _result_case;
            }
            set {
                _result_case = value;
                _result_case_name = value.to_string ();
            }
        }
        private Case _result_case;

        /**
         * Currently specified and expected case as representing input text, in string.
         * 
         * @since 1.1.0
         */
        public string source_case_name {
            get {
                return _source_case_name;
            }
            set {
                if (set_source_case_from_string (value)) {
                    _source_case_name = value;
                }
            }
        }
        private string _source_case_name;

        /**
         * Currently specified case for output text, in string.
         */
        public string result_case_name {
            get {
                return _result_case_name;
            }
            set {
                if (set_result_case_from_string (value)) {
                    _result_case_name = value;
                }
            }
        }
        private string _result_case_name;

        /**
         * Creates a new {@link ChCase.Converter} object with no specified cases.
         */
        public Converter () {
        }

        /**
         * Creates a new {@link ChCase.Converter} object with the specified cases.
         * 
         * @param src_case Expected case as representing input text
         * @param res_case Case for output text
         */
        public Converter.with_case (Case src_case, Case res_case) {
            source_case = src_case;
            result_case = res_case;
        }

        /**
         * Creates a new {@link ChCase.Converter} object with the specified cases in string.
         * 
         * @param src_case Expected case as representing input text, in string
         * @param res_case Case for output text, in string
         */
        public Converter.with_case_from_string (string src_case, string res_case) {
            set_source_case_from_string (src_case);
            set_result_case_from_string (res_case);
        }

        /**
         * Set currently specified and expected case as representing input text.
         * 
         * @param targ_case Expected case as representing input text
         * @since 1.1.0
         */
        [CCode (cname = "_set_source_case")]
        public void set_source_case (Case src_case) {
            source_case = src_case;
        }

        /**
         * Set currently specified case for output text.
         * 
         * @param res_case Case for output text
         */
        [CCode (cname = "_set_result_case")]
        public void set_result_case (Case res_case) {
            result_case = res_case;
        }

        /**
         * Get currently specified and expected case as representing input text.
         * 
         * @return Expected case as representing input text
         * @since 1.1.0
         */
        [CCode (cname = "_get_source_case")]
        public Case get_source_case () {
            return source_case;
        }

        /**
         * Get currently specified case for output text.
         * 
         * @return Case for output text
         * @since 1.1.0
         */
        [CCode (cname = "_get_result_case")]
        public Case get_result_case () {
            return result_case;
        }

        /**
         * Set currently specified and expected case as representing input text, in string.
         * 
         * @param src_case Expected case as representing input text
         * @return true if the case is one of {@link ChCase.Case}
         * @since 1.1.0
         */
        public bool set_source_case_from_string (string src_case) {
            switch (src_case) {
                case "space_separated":
                    source_case = Case.SPACE_SEPARATED;
                    return true;
                case "camel":
                    source_case = Case.CAMEL;
                    return true;
                case "pascal":
                    source_case = Case.PASCAL;
                    return true;
                case "snake":
                    source_case = Case.SNAKE;
                    return true;
                case "kebab":
                    source_case = Case.KEBAB;
                    return true;
                case "sentence":
                    source_case = Case.SENTENCE;
                    return true;
                default:
                    warning ("Unexpected case, does nothing.");
                    return false;
            }
        }

        /**
         * Set currently specified case for output text, in string.
         * 
         * @return true if the case is one of {@link ChCase.Case}
         */
        public bool set_result_case_from_string (string res_case) {
            switch (res_case) {
                case "space_separated":
                    result_case = Case.SPACE_SEPARATED;
                    return true;
                case "camel":
                    result_case = Case.CAMEL;
                    return true;
                case "pascal":
                    result_case = Case.PASCAL;
                    return true;
                case "snake":
                    result_case = Case.SNAKE;
                    return true;
                case "kebab":
                    result_case = Case.KEBAB;
                    return true;
                case "sentence":
                    result_case = Case.SENTENCE;
                    return true;
                default:
                    warning ("Unexpected case, does nothing.");
                    return false;
            }
        }

        /**
         * Get currently specified and expected case as representing input text, in string.
         * 
         * @return Expected case as representing input text
         * @since 1.1.0
         */
        public string get_source_case_from_string () {
            return source_case_name;
        }

        /**
         * Get currently specified case for output text, in string.
         * 
         * @return Case for output text
         * @since 1.1.0
         */
        public string get_result_case_from_string () {
            return result_case_name;
        }

        /**
         * Perform case conversion.
         * 
         * @param text Text to be converted
         * @return Result text after conversion
         */
        public string convert_case (owned string text) {
            var patterns = new GLib.Array<string> ();
            var replace_patterns = new GLib.Array<string> ();

            PatternType.Pattern regex_pattern;
            switch (source_case) {
                case Case.SPACE_SEPARATED:
                    regex_pattern = new PatternType.SpaceSeparated (result_case);
                    break;
                case Case.CAMEL:
                    regex_pattern = new PatternType.Camel (result_case);
                    break;
                case Case.PASCAL:
                    regex_pattern = new PatternType.Pascal (result_case);
                    break;
                case Case.SNAKE:
                    regex_pattern = new PatternType.Snake (result_case);
                    break;
                case Case.KEBAB:
                    regex_pattern = new PatternType.Kebab (result_case);
                    break;
                case Case.SENTENCE:
                    regex_pattern = new PatternType.Sentence (result_case);
                    break;
                default:
                    assert_not_reached ();
            }

            regex_pattern.set_regex (ref patterns, ref replace_patterns);

            MatchInfo match_info;
            try {
                for (int i = 0; i < patterns.length; i++) {
                    var regex = new Regex (patterns.index (i));
                    for (regex.match (text, 0, out match_info); match_info.matches (); match_info.next ()) {
                        text = regex.replace (text, text.length, 0, replace_patterns.index (i));
                    }
                }
            } catch (RegexError e) {
                warning (e.message);
            }

            return text;
        }
    }
}
