# This Raku module is generated from raygui.h
unit module Raygui::Bindings:ver<0.0.7>:auth<zef:vushu>;
use Raylib::Bindings;
use NativeCall;
constant LIBRAYGUI = %?RESOURCES<libraries/raygui>;
class GuiStyleProp is export is repr('CStruct') is rw {
    has uint16 $.controlId;
    has uint16 $.propertyId;
    has int32 $.propertyValue;
    method init(int16 $controlId,int16 $propertyId,int32 $propertyValue) returns GuiStyleProp {
        malloc-GuiStyleProp($controlId,$propertyId,$propertyValue);
    }
    submethod DESTROY {
        free-GuiStyleProp(self);
    }
}
enum GuiState is export (
    STATE_NORMAL => 0,
    STATE_FOCUSED => 1,
    STATE_PRESSED => 2,
    STATE_DISABLED => 3,
);
enum GuiTextAlignment is export (
    TEXT_ALIGN_LEFT => 0,
    TEXT_ALIGN_CENTER => 1,
    TEXT_ALIGN_RIGHT => 2,
);
enum GuiTextAlignmentVertical is export (
    TEXT_ALIGN_TOP => 0,
    TEXT_ALIGN_MIDDLE => 1,
    TEXT_ALIGN_BOTTOM => 2,
);
enum GuiTextWrapMode is export (
    TEXT_WRAP_NONE => 0,
    TEXT_WRAP_CHAR => 1,
    TEXT_WRAP_WORD => 2,
);
enum GuiControl is export (
    DEFAULT => 0,
    LABEL => 1,
    BUTTON => 2,
    TOGGLE => 3,
    SLIDER => 4,
    PROGRESSBAR => 5,
    CHECKBOX => 6,
    COMBOBOX => 7,
    DROPDOWNBOX => 8,
    TEXTBOX => 9,
    VALUEBOX => 10,
    SPINNER => 11,
    LISTVIEW => 12,
    COLORPICKER => 13,
    SCROLLBAR => 14,
    STATUSBAR => 15,
);
enum GuiControlProperty is export (
    BORDER_COLOR_NORMAL => 0,
    BASE_COLOR_NORMAL => 1,
    TEXT_COLOR_NORMAL => 2,
    BORDER_COLOR_FOCUSED => 3,
    BASE_COLOR_FOCUSED => 4,
    TEXT_COLOR_FOCUSED => 5,
    BORDER_COLOR_PRESSED => 6,
    BASE_COLOR_PRESSED => 7,
    TEXT_COLOR_PRESSED => 8,
    BORDER_COLOR_DISABLED => 9,
    BASE_COLOR_DISABLED => 10,
    TEXT_COLOR_DISABLED => 11,
    BORDER_WIDTH => 12,
    TEXT_PADDING => 13,
    TEXT_ALIGNMENT => 14,
);
enum GuiDefaultProperty is export (
    TEXT_SIZE => 16,
    TEXT_SPACING => 17,
    LINE_COLOR => 18,
    BACKGROUND_COLOR => 19,
    TEXT_LINE_SPACING => 20,
    TEXT_ALIGNMENT_VERTICAL => 21,
    TEXT_WRAP_MODE => 22,
);
enum GuiToggleProperty is export (
    GROUP_PADDING => 16,
);
enum GuiSliderProperty is export (
    SLIDER_WIDTH => 16,
    SLIDER_PADDING => 17,
);
enum GuiProgressBarProperty is export (
    PROGRESS_PADDING => 16,
);
enum GuiScrollBarProperty is export (
    ARROWS_SIZE => 16,
    ARROWS_VISIBLE => 17,
    SCROLL_SLIDER_PADDING => 18,
    SCROLL_SLIDER_SIZE => 19,
    SCROLL_PADDING => 20,
    SCROLL_SPEED => 21,
);
enum GuiCheckBoxProperty is export (
    CHECK_PADDING => 16,
);
enum GuiComboBoxProperty is export (
    COMBO_BUTTON_WIDTH => 16,
    COMBO_BUTTON_SPACING => 17,
);
enum GuiDropdownBoxProperty is export (
    ARROW_PADDING => 16,
    DROPDOWN_ITEMS_SPACING => 17,
);
enum GuiTextBoxProperty is export (
    TEXT_READONLY => 16,
);
enum GuiSpinnerProperty is export (
    SPIN_BUTTON_WIDTH => 16,
    SPIN_BUTTON_SPACING => 17,
);
enum GuiListViewProperty is export (
    LIST_ITEMS_HEIGHT => 16,
    LIST_ITEMS_SPACING => 17,
    SCROLLBAR_WIDTH => 18,
    SCROLLBAR_SIDE => 19,
);
enum GuiColorPickerProperty is export (
    COLOR_SELECTOR_SIZE => 16,
    HUEBAR_WIDTH => 17,
    HUEBAR_PADDING => 18,
    HUEBAR_SELECTOR_HEIGHT => 19,
    HUEBAR_SELECTOR_OVERFLOW => 20,
);
our sub term:<gui-enable> () is export is native(LIBRAYGUI) is symbol('GuiEnable'){ * }
our sub term:<gui-disable> () is export is native(LIBRAYGUI) is symbol('GuiDisable'){ * }
our sub term:<gui-lock> () is export is native(LIBRAYGUI) is symbol('GuiLock'){ * }
our sub term:<gui-unlock> () is export is native(LIBRAYGUI) is symbol('GuiUnlock'){ * }
our sub term:<gui-is-locked> () returns bool is export is native(LIBRAYGUI) is symbol('GuiIsLocked'){ * }
our sub gui-set-alpha (num32 $alpha) is export is native(LIBRAYGUI) is symbol('GuiSetAlpha'){ * }
our sub gui-set-state (int32 $state) is export is native(LIBRAYGUI) is symbol('GuiSetState'){ * }
our sub term:<gui-get-state> () returns int32 is export is native(LIBRAYGUI) is symbol('GuiGetState'){ * }
our sub gui-set-style (int32 $control, int32 $property, int32 $value) is export is native(LIBRAYGUI) is symbol('GuiSetStyle'){ * }
our sub gui-get-style (int32 $control, int32 $property) returns int32 is export is native(LIBRAYGUI) is symbol('GuiGetStyle'){ * }
our sub gui-load-style (Str $fileName) is export is native(LIBRAYGUI) is symbol('GuiLoadStyle'){ * }
our sub term:<gui-load-style-default> () is export is native(LIBRAYGUI) is symbol('GuiLoadStyleDefault'){ * }
our sub term:<gui-enable-tooltip> () is export is native(LIBRAYGUI) is symbol('GuiEnableTooltip'){ * }
our sub term:<gui-disable-tooltip> () is export is native(LIBRAYGUI) is symbol('GuiDisableTooltip'){ * }
our sub gui-set-tooltip (Str $tooltip) is export is native(LIBRAYGUI) is symbol('GuiSetTooltip'){ * }
our sub gui-icon-text (int32 $iconId, Str $text) returns Str is export is native(LIBRAYGUI) is symbol('GuiIconText'){ * }
our sub gui-set-icon-scale (int32 $scale) is export is native(LIBRAYGUI) is symbol('GuiSetIconScale'){ * }
our sub term:<gui-get-icons> () returns int32 is export is native(LIBRAYGUI) is symbol('GuiGetIcons'){ * }
our sub gui-load-icons (Str $fileName, bool $loadIconsName) returns Str is export is native(LIBRAYGUI) is symbol('GuiLoadIcons'){ * }
enum GuiIconName is export (
    ICON_NONE => 0,
    ICON_FOLDER_FILE_OPEN => 1,
    ICON_FILE_SAVE_CLASSIC => 2,
    ICON_FOLDER_OPEN => 3,
    ICON_FOLDER_SAVE => 4,
    ICON_FILE_OPEN => 5,
    ICON_FILE_SAVE => 6,
    ICON_FILE_EXPORT => 7,
    ICON_FILE_ADD => 8,
    ICON_FILE_DELETE => 9,
    ICON_FILETYPE_TEXT => 10,
    ICON_FILETYPE_AUDIO => 11,
    ICON_FILETYPE_IMAGE => 12,
    ICON_FILETYPE_PLAY => 13,
    ICON_FILETYPE_VIDEO => 14,
    ICON_FILETYPE_INFO => 15,
    ICON_FILE_COPY => 16,
    ICON_FILE_CUT => 17,
    ICON_FILE_PASTE => 18,
    ICON_CURSOR_HAND => 19,
    ICON_CURSOR_POINTER => 20,
    ICON_CURSOR_CLASSIC => 21,
    ICON_PENCIL => 22,
    ICON_PENCIL_BIG => 23,
    ICON_BRUSH_CLASSIC => 24,
    ICON_BRUSH_PAINTER => 25,
    ICON_WATER_DROP => 26,
    ICON_COLOR_PICKER => 27,
    ICON_RUBBER => 28,
    ICON_COLOR_BUCKET => 29,
    ICON_TEXT_T => 30,
    ICON_TEXT_A => 31,
    ICON_SCALE => 32,
    ICON_RESIZE => 33,
    ICON_FILTER_POINT => 34,
    ICON_FILTER_BILINEAR => 35,
    ICON_CROP => 36,
    ICON_CROP_ALPHA => 37,
    ICON_SQUARE_TOGGLE => 38,
    ICON_SYMMETRY => 39,
    ICON_SYMMETRY_HORIZONTAL => 40,
    ICON_SYMMETRY_VERTICAL => 41,
    ICON_LENS => 42,
    ICON_LENS_BIG => 43,
    ICON_EYE_ON => 44,
    ICON_EYE_OFF => 45,
    ICON_FILTER_TOP => 46,
    ICON_FILTER => 47,
    ICON_TARGET_POINT => 48,
    ICON_TARGET_SMALL => 49,
    ICON_TARGET_BIG => 50,
    ICON_TARGET_MOVE => 51,
    ICON_CURSOR_MOVE => 52,
    ICON_CURSOR_SCALE => 53,
    ICON_CURSOR_SCALE_RIGHT => 54,
    ICON_CURSOR_SCALE_LEFT => 55,
    ICON_UNDO => 56,
    ICON_REDO => 57,
    ICON_REREDO => 58,
    ICON_MUTATE => 59,
    ICON_ROTATE => 60,
    ICON_REPEAT => 61,
    ICON_SHUFFLE => 62,
    ICON_EMPTYBOX => 63,
    ICON_TARGET => 64,
    ICON_TARGET_SMALL_FILL => 65,
    ICON_TARGET_BIG_FILL => 66,
    ICON_TARGET_MOVE_FILL => 67,
    ICON_CURSOR_MOVE_FILL => 68,
    ICON_CURSOR_SCALE_FILL => 69,
    ICON_CURSOR_SCALE_RIGHT_FILL => 70,
    ICON_CURSOR_SCALE_LEFT_FILL => 71,
    ICON_UNDO_FILL => 72,
    ICON_REDO_FILL => 73,
    ICON_REREDO_FILL => 74,
    ICON_MUTATE_FILL => 75,
    ICON_ROTATE_FILL => 76,
    ICON_REPEAT_FILL => 77,
    ICON_SHUFFLE_FILL => 78,
    ICON_EMPTYBOX_SMALL => 79,
    ICON_BOX => 80,
    ICON_BOX_TOP => 81,
    ICON_BOX_TOP_RIGHT => 82,
    ICON_BOX_RIGHT => 83,
    ICON_BOX_BOTTOM_RIGHT => 84,
    ICON_BOX_BOTTOM => 85,
    ICON_BOX_BOTTOM_LEFT => 86,
    ICON_BOX_LEFT => 87,
    ICON_BOX_TOP_LEFT => 88,
    ICON_BOX_CENTER => 89,
    ICON_BOX_CIRCLE_MASK => 90,
    ICON_POT => 91,
    ICON_ALPHA_MULTIPLY => 92,
    ICON_ALPHA_CLEAR => 93,
    ICON_DITHERING => 94,
    ICON_MIPMAPS => 95,
    ICON_BOX_GRID => 96,
    ICON_GRID => 97,
    ICON_BOX_CORNERS_SMALL => 98,
    ICON_BOX_CORNERS_BIG => 99,
    ICON_FOUR_BOXES => 100,
    ICON_GRID_FILL => 101,
    ICON_BOX_MULTISIZE => 102,
    ICON_ZOOM_SMALL => 103,
    ICON_ZOOM_MEDIUM => 104,
    ICON_ZOOM_BIG => 105,
    ICON_ZOOM_ALL => 106,
    ICON_ZOOM_CENTER => 107,
    ICON_BOX_DOTS_SMALL => 108,
    ICON_BOX_DOTS_BIG => 109,
    ICON_BOX_CONCENTRIC => 110,
    ICON_BOX_GRID_BIG => 111,
    ICON_OK_TICK => 112,
    ICON_CROSS => 113,
    ICON_ARROW_LEFT => 114,
    ICON_ARROW_RIGHT => 115,
    ICON_ARROW_DOWN => 116,
    ICON_ARROW_UP => 117,
    ICON_ARROW_LEFT_FILL => 118,
    ICON_ARROW_RIGHT_FILL => 119,
    ICON_ARROW_DOWN_FILL => 120,
    ICON_ARROW_UP_FILL => 121,
    ICON_AUDIO => 122,
    ICON_FX => 123,
    ICON_WAVE => 124,
    ICON_WAVE_SINUS => 125,
    ICON_WAVE_SQUARE => 126,
    ICON_WAVE_TRIANGULAR => 127,
    ICON_CROSS_SMALL => 128,
    ICON_PLAYER_PREVIOUS => 129,
    ICON_PLAYER_PLAY_BACK => 130,
    ICON_PLAYER_PLAY => 131,
    ICON_PLAYER_PAUSE => 132,
    ICON_PLAYER_STOP => 133,
    ICON_PLAYER_NEXT => 134,
    ICON_PLAYER_RECORD => 135,
    ICON_MAGNET => 136,
    ICON_LOCK_CLOSE => 137,
    ICON_LOCK_OPEN => 138,
    ICON_CLOCK => 139,
    ICON_TOOLS => 140,
    ICON_GEAR => 141,
    ICON_GEAR_BIG => 142,
    ICON_BIN => 143,
    ICON_HAND_POINTER => 144,
    ICON_LASER => 145,
    ICON_COIN => 146,
    ICON_EXPLOSION => 147,
    ICON_1UP => 148,
    ICON_PLAYER => 149,
    ICON_PLAYER_JUMP => 150,
    ICON_KEY => 151,
    ICON_DEMON => 152,
    ICON_TEXT_POPUP => 153,
    ICON_GEAR_EX => 154,
    ICON_CRACK => 155,
    ICON_CRACK_POINTS => 156,
    ICON_STAR => 157,
    ICON_DOOR => 158,
    ICON_EXIT => 159,
    ICON_MODE_2D => 160,
    ICON_MODE_3D => 161,
    ICON_CUBE => 162,
    ICON_CUBE_FACE_TOP => 163,
    ICON_CUBE_FACE_LEFT => 164,
    ICON_CUBE_FACE_FRONT => 165,
    ICON_CUBE_FACE_BOTTOM => 166,
    ICON_CUBE_FACE_RIGHT => 167,
    ICON_CUBE_FACE_BACK => 168,
    ICON_CAMERA => 169,
    ICON_SPECIAL => 170,
    ICON_LINK_NET => 171,
    ICON_LINK_BOXES => 172,
    ICON_LINK_MULTI => 173,
    ICON_LINK => 174,
    ICON_LINK_BROKE => 175,
    ICON_TEXT_NOTES => 176,
    ICON_NOTEBOOK => 177,
    ICON_SUITCASE => 178,
    ICON_SUITCASE_ZIP => 179,
    ICON_MAILBOX => 180,
    ICON_MONITOR => 181,
    ICON_PRINTER => 182,
    ICON_PHOTO_CAMERA => 183,
    ICON_PHOTO_CAMERA_FLASH => 184,
    ICON_HOUSE => 185,
    ICON_HEART => 186,
    ICON_CORNER => 187,
    ICON_VERTICAL_BARS => 188,
    ICON_VERTICAL_BARS_FILL => 189,
    ICON_LIFE_BARS => 190,
    ICON_INFO => 191,
    ICON_CROSSLINE => 192,
    ICON_HELP => 193,
    ICON_FILETYPE_ALPHA => 194,
    ICON_FILETYPE_HOME => 195,
    ICON_LAYERS_VISIBLE => 196,
    ICON_LAYERS => 197,
    ICON_WINDOW => 198,
    ICON_HIDPI => 199,
    ICON_FILETYPE_BINARY => 200,
    ICON_HEX => 201,
    ICON_SHIELD => 202,
    ICON_FILE_NEW => 203,
    ICON_FOLDER_ADD => 204,
    ICON_ALARM => 205,
    ICON_CPU => 206,
    ICON_ROM => 207,
    ICON_STEP_OVER => 208,
    ICON_STEP_INTO => 209,
    ICON_STEP_OUT => 210,
    ICON_RESTART => 211,
    ICON_BREAKPOINT_ON => 212,
    ICON_BREAKPOINT_OFF => 213,
    ICON_BURGER_MENU => 214,
    ICON_CASE_SENSITIVE => 215,
    ICON_REG_EXP => 216,
    ICON_FOLDER => 217,
    ICON_FILE => 218,
    ICON_SAND_TIMER => 219,
    ICON_220 => 220,
    ICON_221 => 221,
    ICON_222 => 222,
    ICON_223 => 223,
    ICON_224 => 224,
    ICON_225 => 225,
    ICON_226 => 226,
    ICON_227 => 227,
    ICON_228 => 228,
    ICON_229 => 229,
    ICON_230 => 230,
    ICON_231 => 231,
    ICON_232 => 232,
    ICON_233 => 233,
    ICON_234 => 234,
    ICON_235 => 235,
    ICON_236 => 236,
    ICON_237 => 237,
    ICON_238 => 238,
    ICON_239 => 239,
    ICON_240 => 240,
    ICON_241 => 241,
    ICON_242 => 242,
    ICON_243 => 243,
    ICON_244 => 244,
    ICON_245 => 245,
    ICON_246 => 246,
    ICON_247 => 247,
    ICON_248 => 248,
    ICON_249 => 249,
    ICON_250 => 250,
    ICON_251 => 251,
    ICON_252 => 252,
    ICON_253 => 253,
    ICON_254 => 254,
    ICON_255 => 255,
);
####### Pointerized functions ########
our sub gui-set-font (Font $font) is export is native(LIBRAYGUI) is symbol('GuiSetFont_pointerized'){ * }
our sub term:<gui-get-font> () returns Font is export is native(LIBRAYGUI) is symbol('GuiGetFont_pointerized'){ * }
our sub gui-draw-icon (int32 $iconId, int32 $posX, int32 $posY, int32 $pixelSize, Color $color) is export is native(LIBRAYGUI) is symbol('GuiDrawIcon_pointerized'){ * }
our sub gui-window-box (Rectangle $bounds, Str $title) returns int32 is export is native(LIBRAYGUI) is symbol('GuiWindowBox_pointerized'){ * }
our sub gui-group-box (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiGroupBox_pointerized'){ * }
our sub gui-line (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiLine_pointerized'){ * }
our sub gui-panel (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiPanel_pointerized'){ * }
our sub gui-tab-bar (Rectangle $bounds, Str $text, int32 $count, int32 $active is rw, ) returns int32 is export is native(LIBRAYGUI) is symbol('GuiTabBar_pointerized'){ * }
our sub gui-scroll-panel (Rectangle $bounds, Str $text, Rectangle $content, Vector2 $scroll is rw, Rectangle $view is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiScrollPanel_pointerized'){ * }
our sub gui-label (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiLabel_pointerized'){ * }
our sub gui-button (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiButton_pointerized'){ * }
our sub gui-label-button (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiLabelButton_pointerized'){ * }
our sub gui-toggle (Rectangle $bounds, Str $text, bool $active is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiToggle_pointerized'){ * }
our sub gui-toggle-group (Rectangle $bounds, Str $text, int32 $active is rw, ) returns int32 is export is native(LIBRAYGUI) is symbol('GuiToggleGroup_pointerized'){ * }
our sub gui-toggle-slider (Rectangle $bounds, Str $text, int32 $active is rw, ) returns int32 is export is native(LIBRAYGUI) is symbol('GuiToggleSlider_pointerized'){ * }
our sub gui-check-box (Rectangle $bounds, Str $text, bool $checked is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiCheckBox_pointerized'){ * }
our sub gui-combo-box (Rectangle $bounds, Str $text, int32 $active is rw, ) returns int32 is export is native(LIBRAYGUI) is symbol('GuiComboBox_pointerized'){ * }
our sub gui-dropdown-box (Rectangle $bounds, Str $text, int32 $active is rw, bool $editMode) returns int32 is export is native(LIBRAYGUI) is symbol('GuiDropdownBox_pointerized'){ * }
our sub gui-spinner (Rectangle $bounds, Str $text, int32 $value is rw, int32 $minValue, int32 $maxValue, bool $editMode) returns int32 is export is native(LIBRAYGUI) is symbol('GuiSpinner_pointerized'){ * }
our sub gui-value-box (Rectangle $bounds, Str $text, int32 $value is rw, int32 $minValue, int32 $maxValue, bool $editMode) returns int32 is export is native(LIBRAYGUI) is symbol('GuiValueBox_pointerized'){ * }
our sub gui-text-box (Rectangle $bounds, CArray[uint8] $text, int32 $textSize, bool $editMode) returns int32 is export is native(LIBRAYGUI) is symbol('GuiTextBox_pointerized'){ * }
our sub gui-slider (Rectangle $bounds, Str $textLeft, Str $textRight, num32 $value is rw, num32 $minValue, num32 $maxValue) returns int32 is export is native(LIBRAYGUI) is symbol('GuiSlider_pointerized'){ * }
our sub gui-slider-bar (Rectangle $bounds, Str $textLeft, Str $textRight, num32 $value is rw, num32 $minValue, num32 $maxValue) returns int32 is export is native(LIBRAYGUI) is symbol('GuiSliderBar_pointerized'){ * }
our sub gui-progress-bar (Rectangle $bounds, Str $textLeft, Str $textRight, num32 $value is rw, num32 $minValue, num32 $maxValue) returns int32 is export is native(LIBRAYGUI) is symbol('GuiProgressBar_pointerized'){ * }
our sub gui-status-bar (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiStatusBar_pointerized'){ * }
our sub gui-dummy-rec (Rectangle $bounds, Str $text) returns int32 is export is native(LIBRAYGUI) is symbol('GuiDummyRec_pointerized'){ * }
our sub gui-grid (Rectangle $bounds, Str $text, num32 $spacing, int32 $subdivs, Vector2 $mouseCell is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiGrid_pointerized'){ * }
our sub gui-list-view (Rectangle $bounds, Str $text, int32 $scrollIndex is rw, int32 $active is rw, ) returns int32 is export is native(LIBRAYGUI) is symbol('GuiListView_pointerized'){ * }
our sub gui-list-view-ex (Rectangle $bounds, Str $text, int32 $count, int32 $scrollIndex is rw, int32 $active is rw, int32 $focus is rw, ) returns int32 is export is native(LIBRAYGUI) is symbol('GuiListViewEx_pointerized'){ * }
our sub gui-message-box (Rectangle $bounds, Str $title, Str $message, Str $buttons) returns int32 is export is native(LIBRAYGUI) is symbol('GuiMessageBox_pointerized'){ * }
our sub gui-text-input-box (Rectangle $bounds, Str $title, Str $message, Str $buttons, CArray[uint8] $text, int32 $textMaxSize, bool $secretViewActive is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiTextInputBox_pointerized'){ * }
our sub gui-color-picker (Rectangle $bounds, Str $text, Color $color is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiColorPicker_pointerized'){ * }
our sub gui-color-panel (Rectangle $bounds, Str $text, Color $color is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiColorPanel_pointerized'){ * }
our sub gui-color-bar-alpha (Rectangle $bounds, Str $text, num32 $alpha is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiColorBarAlpha_pointerized'){ * }
our sub gui-color-bar-hue (Rectangle $bounds, Str $text, num32 $value is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiColorBarHue_pointerized'){ * }
our sub gui-color-picker-hsv (Rectangle $bounds, Str $text, Vector3 $colorHsv is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiColorPickerHSV_pointerized'){ * }
our sub gui-color-panel-hsv (Rectangle $bounds, Str $text, Vector3 $colorHsv is rw) returns int32 is export is native(LIBRAYGUI) is symbol('GuiColorPanelHSV_pointerized'){ * }
####### Allocation functions ########
our sub malloc-GuiStyleProp(int16 $controlId,int16 $propertyId,int32 $propertyValue) returns GuiStyleProp is native(LIBRAYGUI) is symbol('malloc_GuiStyleProp') {*}
our sub free-GuiStyleProp(GuiStyleProp $ptr) is native(LIBRAYGUI) is symbol('free_GuiStyleProp') {*}
