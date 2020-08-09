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
        KEBAB;

        /**
         * Return the case in string.
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
                default:
                    assert_not_reached ();
            }
        }
    }
}
