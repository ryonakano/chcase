/*
* Copyright 2020-2021 Ryo Nakano
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

namespace ChCase.PatternType {

    /**
    * An abstract class to set regex pattern to be used when converting case.
    *
    * This class should not be used outside of the library.
    *
    * @since 2.1.0
    */
    protected abstract class Pattern : GLib.Object {
        protected Case result_case;

        protected Pattern (Case result_case) {
            this.result_case = result_case;
        }

        /**
         * Set regex patterns―one is to detect the source case and another is to detect the result case.
         * 
         * @since 2.1.0
         */
        public abstract void set_regex (ref GLib.Array<string> patterns, ref GLib.Array<string> replace_patterns);
    }
}
