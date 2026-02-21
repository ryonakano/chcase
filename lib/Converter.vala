/*
 * SPDX-License-Identifier: LGPL-3.0-or-later
 * SPDX-FileCopyrightText: 2020-2023 Ryo Nakano <ryonakaknock3@gmail.com>
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
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.input_case")]
        public Case source_case {
            get {
                return input_case;
            }
            set {
                input_case = value;
            }
        }
        /**
         * Currently specified and expected case as representing input text.
         *
         * @since 2.4.0
         */
        public Case input_case {
            get {
                return _input_case;
            }
            set {
                _input_case = value;
                _input_case_name = value.to_string ();
            }
        }
        private Case _input_case;

        /**
         * Currently specified case for output text.
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.output_case")]
        public Case result_case {
            get {
                return output_case;
            }
            set {
                output_case = value;
            }
        }
        /**
         * Currently specified case for output text.
         *
         * @since 2.4.0
         */
        public Case output_case {
            get {
                return _output_case;
            }
            set {
                _output_case = value;
                _output_case_name = value.to_string ();
            }
        }
        private Case _output_case;

        /**
         * Currently specified and expected case as representing input text, in string.
         *
         * @since 1.1.0
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.input_case_name")]
        public string source_case_name {
            get {
                return input_case_name;
            }
            set {
                input_case_name = value;
            }
        }
        /**
         * Currently specified and expected case as representing input text, in string.
         *
         * @since 2.4.0
         */
        public string input_case_name {
            get {
                return _input_case_name;
            }
            set {
                if (set_input_case_from_string (value)) {
                    _input_case_name = value;
                }
            }
        }
        private string _input_case_name;

        /**
         * Currently specified case for output text, in string.
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.output_case_name")]
        public string result_case_name {
            get {
                return output_case_name;
            }
            set {
                output_case_name = value;
            }
        }
        /**
         * Currently specified case for output text, in string.
         *
         * @since 2.4.0
         */
        public string output_case_name {
            get {
                return _output_case_name;
            }
            set {
                if (set_output_case_from_string (value)) {
                    _output_case_name = value;
                }
            }
        }
        private string _output_case_name;

        /**
         * Creates a new {@link ChCase.Converter} object with no specified cases.
         */
        public Converter () {
        }

        /**
         * Creates a new {@link ChCase.Converter} object with the specified cases.
         *
         * @param in_case Expected case as representing input text
         * @param out_case Case for output text
         */
        public Converter.with_case (Case in_case, Case out_case) {
            input_case = in_case;
            output_case = out_case;
        }

        /**
         * Creates a new {@link ChCase.Converter} object with the specified cases in string.
         *
         * @param in_case Expected case as representing input text, in string
         * @param out_case Case for output text, in string
         */
        public Converter.with_case_from_string (string in_case, string out_case) {
            set_input_case_from_string (in_case);
            set_output_case_from_string (out_case);
        }

        /**
         * Set currently specified and expected case as representing input text.
         *
         * @param src_case Expected case as representing input text
         * @since 1.1.0
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.set_input_case")]
        [CCode (cname = "_set_source_case")]
        public void set_source_case (Case src_case) {
            set_input_case (src_case);
        }
        /**
         * Set currently specified and expected case as representing input text.
         *
         * @param in_case Expected case as representing input text
         * @since 2.4.0
         */
        [CCode (cname = "_set_input_case")]
        public void set_input_case (Case in_case) {
            input_case = in_case;
        }

        /**
         * Set currently specified case for output text.
         *
         * @param res_case Case for output text
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.set_output_case")]
        [CCode (cname = "_set_result_case")]
        public void set_result_case (Case res_case) {
            set_output_case (res_case);
        }
        /**
         * Set currently specified case for output text.
         *
         * @param out_case Case for output text
         * @since 2.4.0
         */
        [CCode (cname = "_set_output_case")]
        public void set_output_case (Case out_case) {
            output_case = out_case;
        }

        /**
         * Get currently specified and expected case as representing input text.
         *
         * @return Expected case as representing input text
         * @since 1.1.0
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.get_input_case")]
        [CCode (cname = "_get_source_case")]
        public Case get_source_case () {
            return get_input_case ();
        }
        /**
         * Get currently specified and expected case as representing input text.
         *
         * @return Expected case as representing input text
         * @since 2.4.0
         */
        [CCode (cname = "_get_input_case")]
        public Case get_input_case () {
            return input_case;
        }

        /**
         * Get currently specified case for output text.
         *
         * @return Case for output text
         * @since 1.1.0
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.get_output_case")]
        [CCode (cname = "_get_result_case")]
        public Case get_result_case () {
            return get_output_case ();
        }
        /**
         * Get currently specified case for output text.
         *
         * @return Case for output text
         * @since 2.4.0
         */
        [CCode (cname = "_get_output_case")]
        public Case get_output_case () {
            return output_case;
        }

        /**
         * Set currently specified and expected case as representing input text, in string.
         *
         * @param src_case Expected case as representing input text
         * @return true if the case is one of {@link ChCase.Case}
         * @since 1.1.0
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.set_input_case_from_string")]
        public bool set_source_case_from_string (string src_case) {
            return set_input_case_from_string (src_case);
        }
        /**
         * Set currently specified and expected case as representing input text, in string.
         *
         * @param in_case Expected case as representing input text
         * @return true if the case is one of {@link ChCase.Case}
         * @since 2.4.0
         */
        public bool set_input_case_from_string (string in_case) {
            switch (in_case) {
                case "space_separated":
                    input_case = Case.SPACE_SEPARATED;
                    return true;
                case "camel":
                    input_case = Case.CAMEL;
                    return true;
                case "pascal":
                    input_case = Case.PASCAL;
                    return true;
                case "snake":
                    input_case = Case.SNAKE;
                    return true;
                case "kebab":
                    input_case = Case.KEBAB;
                    return true;
                case "sentence":
                    input_case = Case.SENTENCE;
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
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.set_output_case_from_string")]
        public bool set_result_case_from_string (string res_case) {
            return set_output_case_from_string (res_case);
        }
        /**
         * Set currently specified case for output text, in string.
         *
         * @return true if the case is one of {@link ChCase.Case}
         * @since 2.4.0
         */
        public bool set_output_case_from_string (string out_case) {
            switch (out_case) {
                case "space_separated":
                    output_case = Case.SPACE_SEPARATED;
                    return true;
                case "camel":
                    output_case = Case.CAMEL;
                    return true;
                case "pascal":
                    output_case = Case.PASCAL;
                    return true;
                case "snake":
                    output_case = Case.SNAKE;
                    return true;
                case "kebab":
                    output_case = Case.KEBAB;
                    return true;
                case "sentence":
                    output_case = Case.SENTENCE;
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
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.get_input_case_from_string")]
        public string get_source_case_from_string () {
            return get_input_case_from_string ();
        }
        /**
         * Get currently specified and expected case as representing input text, in string.
         *
         * @return Expected case as representing input text
         * @since 2.4.0
         */
        public string get_input_case_from_string () {
            return input_case_name;
        }

        /**
         * Get currently specified case for output text, in string.
         *
         * @return Case for output text
         * @since 1.1.0
         */
        [Version (deprecated = true, deprecated_since = "2.4.0", replacement = "ChCase.Converter.get_output_case_from_string")]
        public string get_result_case_from_string () {
            return get_output_case_from_string ();
        }
        /**
         * Get currently specified case for output text, in string.
         *
         * @return Case for output text
         * @since 2.4.0
         */
        public string get_output_case_from_string () {
            return output_case_name;
        }

        /**
         * Perform case conversion.
         *
         * @param text Text to be converted
         * @return Result text after conversion
         */
        public string convert_case (string text) {
            string result = text;
            PatternType.Pattern regex_pattern;
            switch (input_case) {
                case Case.SPACE_SEPARATED:
                    regex_pattern = new PatternType.SpaceSeparated (output_case);
                    break;
                case Case.CAMEL:
                    regex_pattern = new PatternType.Camel (output_case);
                    break;
                case Case.PASCAL:
                    regex_pattern = new PatternType.Pascal (output_case);
                    break;
                case Case.SNAKE:
                    regex_pattern = new PatternType.Snake (output_case);
                    break;
                case Case.KEBAB:
                    regex_pattern = new PatternType.Kebab (output_case);
                    break;
                case Case.SENTENCE:
                    regex_pattern = new PatternType.Sentence (output_case);
                    break;
                default:
                    warning ("Invalid Case: %d", input_case);
                    return result;
            }

            try {
                for (int i = 0; i < regex_pattern.detect_patterns.length; i++) {
                    var regex = new Regex (regex_pattern.detect_patterns.index (i));
                    result = regex.replace (result, result.length, 0, regex_pattern.replace_patterns.index (i));
                }
            } catch (RegexError e) {
                warning (e.message);
            }

            return result;
        }
    }
}
