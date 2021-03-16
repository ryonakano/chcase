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
    public class Snake : Pattern {
        public Snake (Case result_case) {
            base (result_case);
        }

        protected override void to_space_separated () {
            patterns.append_val ("_(.)");
            replace_patterns.append_val (" \\1");
        }

        protected override void to_camel () {
            patterns.append_val ("_(.)");
            replace_patterns.append_val ("\\u\\1");
        }

        protected override void to_pascal () {
            patterns.append_val ("(_|^)(.)");
            replace_patterns.append_val ("\\u\\2");
        }

        protected override void to_snake () {
            // The chosen result case is the same with source case, does nothing.
        }

        protected override void to_kebab () {
            patterns.append_val ("(_)(.)");
            replace_patterns.append_val ("-\\2");
        }

        protected override void to_sentence () {
            patterns.append_val ("^(.)");
            replace_patterns.append_val ("\\u\\1");
            patterns.append_val ("_(.)");
            replace_patterns.append_val (" \\1");
        }
    }
}
