use Raygui::Grammar;
use Raygui::Actions;

constant generation-message = "# This Raku module is generated from raygui.h";

sub generate-bindings($raygui-h-file, $output-dir) is export {
    say $raygui-h-file;
    say "Generating raygui bindings...";
    my $parser = Grammar.new;
    my $actions = Actions.new;
    $actions.library-name = "LIBRAYGUI";
    my $raylib = slurp $raygui-h-file;
    my $parsed = $parser.parse($raylib, actions => $actions);

    my $file  = open "lib/Raygui/Bindings.rakumod", :w;
    $file.say(generation-message);
    $file.say("unit module Raygui::Bindings:ver<0.0.7>:auth<zef:vushu>;");
    $file.say("use Raylib::Bindings;");
    $file.say("use NativeCall;");
    $file.say("constant LIBRAYGUI = %\?RESOURCES<libraries/raygui>;");
    for $actions.bindings -> $binding {
        $file.say($binding);
    }

    $file.say("####### Pointerized functions ########");
    for $actions.pointerized_bindings -> $binding {
        $file.say($binding);
    }

    $file.say("####### Allocation functions ########");
    for $actions.alloc_bindings -> $binding {
        $file.say($binding);
    }

    $file.close;

    my $wrapper_file  = open "resources/raygui_modified.c", :a;
    $wrapper_file.say("\r// -------------------- GENERATED BY RAYGUI-RAKU -----------------\r\n");
    $wrapper_file.say("// Adding pointerized functions generated by raygui-raku");
    for $actions.c_pointerize_bindings -> $binding {
        $wrapper_file.say($binding);
    }
    $wrapper_file.close;

    my $alloc_file  = open "resources/raygui_modified.c", :a;
    $alloc_file.say("// Adding allocation functions generated by raygui-raku");

    for $actions.c_alloc_funtions -> $binding {
        $alloc_file.say($binding);
    }
    $alloc_file.close;
    say "Done generating raygui bindings!";
}



sub MAIN {
    generate-bindings($*CWD);
}