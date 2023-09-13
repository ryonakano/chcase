/*
 * SPDX-License-Identifier: LGPL-3.0-or-later
 * SPDX-FileCopyrightText: 2020-2023 Ryo Nakano <ryonakaknock3@gmail.com>
 */

namespace ChCase {

    /**
     * Represents the case of a text.
     */
    public enum Case {
        /**
         * Text that uses a space for separation, e.g. "do null check before quitting".
         */
        SPACE_SEPARATED,

        /**
         * Camel Case text, e.g. "doNullCheckBeforeQuitting".
         */
        CAMEL,

        /**
         * Pascal Case text, e.g. "DoNullCheckBeforeQuitting".
         */
        PASCAL,

        /**
         * Snake Case text, e.g. "do_null_check_before_quitting".
         */
        SNAKE,

        /**
         * Kebab Case text, e.g. "do-null-check-before-quitting".
         */
        KEBAB,

        /**
         * Sentence Case text, e.g. "Do null check before quitting".
         */
        SENTENCE;

        /**
         * Return the case in string.
         * 
         * @return the case represented in string.
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
                    assert_not_reached ();
            }
        }
    }
}
