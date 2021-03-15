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
    public class Kebab : Pattern {
        public Kebab (Case result_case) {
            base (result_case);
        }

        public override void set_regex (ref GLib.Array<string> patterns, ref GLib.Array<string> replace_patterns) {
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
                    // The chosen result case is the same with source case, does nothing.
                    break;
                case Case.SENTENCE:
                    patterns.append_val ("^(.)");
                    replace_patterns.append_val ("\\u\\1");
                    patterns.append_val ("-(.)");
                    replace_patterns.append_val (" \\1");
                    break;
                default:
                    warning ("Unexpected case, does nothing.");
                    break;
            }
        }
    }
}
