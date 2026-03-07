/*
 * SPDX-License-Identifier: LGPL-3.0-or-later
 * SPDX-FileCopyrightText: 2020-2023 Ryo Nakano <ryonakaknock3@gmail.com>
 */

namespace ChCase {

    /**
     * Type of letter cases in a piece of text.
     */
    public enum Case {
        /**
         * Use a space as a word separator, e.g. "foo bar baz".
         */
        SPACE_SEPARATED,

        /**
         * Camel Case, e.g. "fooBarBaz".
         */
        CAMEL,

        /**
         * Pascal Case, e.g. "FooBarBaz".
         */
        PASCAL,

        /**
         * Snake Case, e.g. "foo_bar_baz".
         */
        SNAKE,

        /**
         * Kebab Case, e.g. "foo-bar-baz".
         */
        KEBAB,

        /**
         * Sentence Case, e.g. "Foo bar baz".
         */
        SENTENCE;

        /**
         * Return the string representation of a letter case.
         * 
         * @return      the string representation of a letter case
         */
        public string to_string () {
            switch (this) {
                case Case.SPACE_SEPARATED:
                    return "space_separated";
                case Case.CAMEL:
                    return "camel";
                case Case.PASCAL:
                    return "pascal";
                case Case.SNAKE:
                    return "snake";
                case Case.KEBAB:
                    return "kebab";
                case Case.SENTENCE:
                    return "sentence";
                default:
                    warning ("Invalid Case: %d", this);
                    return "";
            }
        }
    }
}
