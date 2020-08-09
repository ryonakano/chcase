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
    *   var converter = new ChCase.Converter (ChCase.Case.SPACE_SEPARATED, ChCase.Case.CAMEL);
    *   string input_text = "say hello to ChCase";
    *   string output_text = converter.convert_case (input_text);
    * }}}
    */
    public class Converter : GLib.Object {
        private GLib.Array<string> patterns;
        private GLib.Array<string> replace_patterns;

        /**
         * Currently specified and expected case as representing input text.
         */
        public Case target_case;

        /**
         * Currently specified case for output text.
         */
        public Case result_case;

        /**
         * Currently specified and expected case as representing input text, in string.
         */
        public string target_case_name {
            get {
                return _target_case_name;
            }
            set {
                if (set_target_case_from_string (value)) {
                    _target_case_name = value;
                }
            }
        }
        private string _target_case_name;

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
         * @param targ_case Expected case as representing input text
         * @param res_case Case for output text
         */
        public Converter.with_case (Case targ_case, Case res_case) {
            target_case = targ_case;
            result_case = res_case;
        }

        /**
         * Creates a new {@link ChCase.Converter} object with the specified cases in string.
         * 
         * @param targ_case Expected case as representing input text, in string
         * @param res_case Case for output text, in string
         */
        public Converter.with_case_from_string (string targ_case, string res_case) {
            set_target_case_from_string (targ_case);
            set_result_case_from_string (res_case);
        }

        /**
         * Set currently specified and expected case as representing input text.
         * 
         * @param targ_case Expected case as representing input text
         */
        public void set_target_case (Case targ_case) {
            target_case = targ_case;
        }

        /**
         * Set currently specified case for output text.
         * 
         * @param res_case Case for output text
         */
        public void set_result_case (Case res_case) {
            result_case = res_case;
        }

        /**
         * Set currently specified and expected case as representing input text, in string.
         * 
         * @return true if the case is one of {@link ChCase.Case}
         */
        public bool set_target_case_from_string (string targ_case) {
            switch (targ_case) {
                case "space_separated":
                    target_case = Case.SPACE_SEPARATED;
                    return true;
                case "camel":
                    target_case = Case.CAMEL;
                    return true;
                case "pascal":
                    target_case = Case.PASCAL;
                    return true;
                case "snake":
                    target_case = Case.SNAKE;
                    return true;
                case "kebab":
                    target_case = Case.KEBAB;
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
                default:
                    warning ("Unexpected case, does nothing.");
                    return false;
            }
        }

        /**
         * Perform case conversion.
         * 
         * @param text Text to be converted
         * @return Result text after conversion
         */
        public string convert_case (owned string text) {
            set_regex ();

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

        private void set_regex () {
            patterns = new GLib.Array<string> ();
            replace_patterns = new GLib.Array<string> ();

            switch (target_case) {
                case Case.SPACE_SEPARATED:
                    set_regex_from_space_separated (ref patterns, ref replace_patterns, result_case);
                    break;
                case Case.CAMEL:
                    set_regex_from_camel_case (ref patterns, ref replace_patterns, result_case);
                    break;
                case Case.PASCAL:
                    set_regex_from_pascal_case (ref patterns, ref replace_patterns, result_case);
                    break;
                case Case.SNAKE:
                    set_regex_from_snake_case (ref patterns, ref replace_patterns, result_case);
                    break;
                case Case.KEBAB:
                    set_regex_from_kebab_case (ref patterns, ref replace_patterns, result_case);
                    break;
            }

            if (patterns.length != replace_patterns.length) {
                warning ("The numbers of patterns to find maching strings and ones to replace them don't match!");
            }
        }

        private void set_regex_from_space_separated (
                        ref GLib.Array<string> patterns,
                        ref GLib.Array<string> replace_patterns,
                        Case result_case
        ) {
            switch (result_case) {
                case Case.SPACE_SEPARATED:
                    // The chosen result case is the same with target case, does nothing.
                    break;
                case Case.CAMEL:
                    patterns.append_val (" (.)");
                    replace_patterns.append_val ("\\u\\1");
                    break;
                case Case.PASCAL:
                    patterns.append_val ("( |^)(.)");
                    replace_patterns.append_val ("\\u\\2");
                    break;
                case Case.SNAKE:
                    patterns.append_val (" (.)");
                    replace_patterns.append_val ("_\\1");
                    break;
                case Case.KEBAB:
                    patterns.append_val ("( )(.)");
                    replace_patterns.append_val ("-\\2");
                    break;
                default:
                    warning ("Unexpected case, does nothing.");
                    break;
            }
        }

        private void set_regex_from_camel_case (
                        ref GLib.Array<string> patterns,
                        ref GLib.Array<string> replace_patterns,
                        Case result_case
        ) {
            switch (result_case) {
                case Case.SPACE_SEPARATED:
                    patterns.append_val ("(\\S)([A-Z])");
                    replace_patterns.append_val ("\\1 \\2");
                    break;
                case Case.CAMEL:
                    // The chosen result case is the same with target case, does nothing.
                    break;
                case Case.PASCAL:
                    patterns.append_val ("^([a-z])");
                    replace_patterns.append_val ("\\u\\1");
                    break;
                case Case.SNAKE:
                    patterns.append_val ("([A-Z])");
                    replace_patterns.append_val ("_\\l\\1");
                    break;
                case Case.KEBAB:
                    patterns.append_val ("([A-Z])");
                    replace_patterns.append_val ("-\\l\\1");
                    break;
                default:
                    warning ("Unexpected case, does nothing.");
                    break;
            }
        }


        private void set_regex_from_pascal_case (
                        ref GLib.Array<string> patterns,
                        ref GLib.Array<string> replace_patterns,
                        Case result_case
        ) {
            switch (result_case) {
                case Case.SPACE_SEPARATED:
                    patterns.append_val ("(\\S)([A-Z])");
                    replace_patterns.append_val ("\\1 \\2");
                    break;
                case Case.CAMEL:
                    patterns.append_val ("^([A-Z])");
                    replace_patterns.append_val ("\\l\\1");
                    break;
                case Case.PASCAL:
                    // The chosen result case is the same with target case, does nothing.
                    break;
                case Case.SNAKE:
                    patterns.append_val ("^([A-Z])");
                    replace_patterns.append_val ("\\l\\1");
                    patterns.append_val ("([A-Z])");
                    replace_patterns.append_val ("_\\l\\1");
                    break;
                case Case.KEBAB:
                    patterns.append_val ("^([A-Z])");
                    replace_patterns.append_val ("\\l\\1");
                    patterns.append_val ("([A-Z])");
                    replace_patterns.append_val ("-\\l\\1");
                    break;
                default:
                    warning ("Unexpected case, does nothing.");
                    break;
            }
        }

        private void set_regex_from_snake_case (
                        ref GLib.Array<string> patterns,
                        ref GLib.Array<string> replace_patterns,
                        Case result_case
        ) {
            switch (result_case) {
                case Case.SPACE_SEPARATED:
                    patterns.append_val ("_(.)");
                    replace_patterns.append_val (" \\1");
                    break;
                case Case.CAMEL:
                    patterns.append_val ("_(.)");
                    replace_patterns.append_val ("\\u\\1");
                    break;
                case Case.PASCAL:
                    patterns.append_val ("(_|^)(.)");
                    replace_patterns.append_val ("\\u\\2");
                    break;
                case Case.SNAKE:
                    // The chosen result case is the same with target case, does nothing.
                    break;
                case Case.KEBAB:
                    patterns.append_val ("(_)(.)");
                    replace_patterns.append_val ("-\\2");
                    break;
                default:
                    warning ("Unexpected case, does nothing.");
                    break;
            }
        }

        private void set_regex_from_kebab_case (
                        ref GLib.Array<string> patterns,
                        ref GLib.Array<string> replace_patterns,
                        Case result_case
        ) {
            switch (result_case) {
                case Case.SPACE_SEPARATED:
                    patterns.append_val ("-(.)");
                    replace_patterns.append_val (" \\1");
                    break;
                case Case.CAMEL:
                    patterns.append_val ("-(.)");
                    replace_patterns.append_val ("\\u\\1");
                    break;
                case Case.PASCAL:
                    patterns.append_val ("(-|^)(.)");
                    replace_patterns.append_val ("\\u\\2");
                    break;
                case Case.SNAKE:
                    patterns.append_val ("-(.)");
                    replace_patterns.append_val ("_\\1");
                    break;
                case Case.KEBAB:
                    // The chosen result case is the same with target case, does nothing.
                    break;
                default:
                    warning ("Unexpected case, does nothing.");
                    break;
            }
        }
    }
}
