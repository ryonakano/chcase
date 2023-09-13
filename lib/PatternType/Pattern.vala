/*
 * SPDX-License-Identifier: LGPL-3.0-or-later
 * SPDX-FileCopyrightText: 2020-2023 Ryo Nakano <ryonakaknock3@gmail.com>
 */

namespace ChCase.PatternType {

    /**
    * An abstract class to set regex pattern to be used when converting case.
    *
    * This class should not be used outside of the library.
    *
    * @since 2.1.0
    */
    protected abstract class Pattern : GLib.Object {

        /**
         * Regex patterns to detect the source case.
         * 
         * @since 2.1.0
         */
        public GLib.Array<string> detect_patterns { get; construct; }

        /**
         * Regex patterns to detect the result case.
         * 
         * @since 2.1.0
         */
        public GLib.Array<string> replace_patterns { get; construct; }

        protected Pattern (Case result_case) {
            switch (result_case) {
                case Case.SPACE_SEPARATED:
                    to_space_separated ();
                    break;
                case Case.CAMEL:
                    to_camel ();
                    break;
                case Case.PASCAL:
                    to_pascal ();
                    break;
                case Case.SNAKE:
                    to_snake ();
                    break;
                case Case.KEBAB:
                    to_kebab ();
                    break;
                case Case.SENTENCE:
                    to_sentence ();
                    break;
                default:
                    warning ("Unexpected case, does nothing.");
                    break;
            }
        }

        construct {
            detect_patterns = new GLib.Array<string> ();
            replace_patterns = new GLib.Array<string> ();
        }

        /**
         * Set regex patterns; one is to detect the source case and another is to detect the result case.
         * 
         * @since 2.1.0
         */
        protected abstract void to_space_separated ();

        /**
         * Set regex patterns; one is to detect the source case and another is to detect the result case.
         * 
         * @since 2.1.0
         */
        protected abstract void to_camel ();

        /**
         * Set regex patterns; one is to detect the source case and another is to detect the result case.
         * 
         * @since 2.1.0
         */
        protected abstract void to_pascal ();

        /**
         * Set regex patterns; one is to detect the source case and another is to detect the result case.
         * 
         * @since 2.1.0
         */
        protected abstract void to_snake ();

        /**
         * Set regex patterns; one is to detect the source case and another is to detect the result case.
         * 
         * @since 2.1.0
         */
        protected abstract void to_kebab ();

        /**
         * Set regex patterns; one is to detect the source case and another is to detect the result case.
         * 
         * @since 2.1.0
         */
        protected abstract void to_sentence ();
    }
}
