use Raylib::Bindings;
use Raygui::Bindings;
use NativeCall;

constant $screen-width = 800;
constant $screen-height = 450;

init-window($screen-width, $screen-height, "raygui-raku - Menu");
my $white = init-raywhite;
set-target-fps(60);

my $button-rect = Rectangle.init($screen-width/2e0-100e0, $screen-height/2e0, 200e0, 30e0);
my $message-box-rect = Rectangle.init($screen-width/2e0, 330e0, 200e0, 30e0);

# 32 characters and 0 zero since it's a c-string.
my $text = CArray[uint8].new(0 xx 32 , 0);

my $close-program = False;
while !$close-program {
    begin-drawing;
        clear-background $white;

        gui-set-style(BUTTON, TEXT_ALIGNMENT, TEXT_ALIGN_CENTER);

        if window-should-close || gui-button($button-rect, gui-icon-text(ICON_EXIT, "QUIT")) {
            $close-program = True;
        }

        if gui-text-box($message-box-rect, $text, 32, True) {
            say "You wrote: ", ($text.map: *.chr).join;
        }


    end-drawing;
}
