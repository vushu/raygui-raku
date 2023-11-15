use Raygui::Bindings;
use Raylib::Bindings;

constant $screen-width = 800e0;
constant $screen-height = 600e0;

set-config-flags(FLAG_WINDOW_UNDECORATED);
init-window($screen-width.Int, $screen-height.Int, "Raygui raku portable window");

my $mouse-position = Vector2.init(0e0, 0e0);
my $window-position = Vector2.init(500e0, 200e0);
my $pan-offset = $mouse-position;
my $drag-window = False;

set-window-position($window-position.x.Int, $window-position.y.Int);

my $exit-window = False;

set-target-fps(60);

my $white = init-raywhite;
my $dark-gray = init-darkgray;

my $rect-collision = Rectangle.init(0e0, 0e0, $screen-width, 20e0);
my $rect-box = Rectangle.init(0e0, 0e0, $screen-width, $screen-height);

while !$exit-window && !window-should-close {

    $mouse-position = get-mouse-position;

    if is-mouse-button-pressed(MOUSE_BUTTON_LEFT) && !$drag-window {
        if check-collision-point-rec($mouse-position, $rect-collision) {
            $drag-window = True;
            $pan-offset = $mouse-position;
        }
    }

    if $drag-window {
        $window-position.x += ($mouse-position.x - $pan-offset.x);
        $window-position.y += ($mouse-position.y - $pan-offset.y);

        set-window-position($window-position.x.Int, $window-position.y.Int);

        $drag-window = False if is-mouse-button-released(MOUSE_BUTTON_LEFT);

    }

    begin-drawing;

        clear-background($white);

        $exit-window = gui-window-box($rect-box, "#198# PORTABLE WINDOW");

        draw-text("Mouse Position: [ {$mouse-position.x}, {$mouse-position.y} ]", 10, 40, 10, $dark-gray);
        draw-text("Window Position: [ {$window-position.x}, {$window-position.y} ]", 10, 60, 10, $dark-gray);

    end-drawing;

}
close-window;