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
    public class SpaceSeparated : Pattern {
        public SpaceSeparated (Case result_case) {
            base (result_case);
        }

        protected override void to_space_separated () {
            // The chosen result case is the same with source case, does nothing.
        }

        protected override void to_camel () {
            detect_patterns.append_val (" (.)");
            replace_patterns.append_val ("\\u\\1");
        }

        protected override void to_pascal () {
            detect_patterns.append_val ("( |^)(.)");
            replace_patterns.append_val ("\\u\\2");
        }

        protected override void to_snake () {
            detect_patterns.append_val (" (.)");
            replace_patterns.append_val ("_\\1");
        }

        protected override void to_kebab () {
            detect_patterns.append_val ("( )(.)");
            replace_patterns.append_val ("-\\2");
        }

        protected override void to_sentence () {
            detect_patterns.append_val ("^(.)");
            replace_patterns.append_val ("\\u\\1");
        }
    }
}
