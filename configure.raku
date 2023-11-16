#!usr/bin/env raku
use lib 'lib';
use Raygui::Generator;

constant $url = "https://raw.githubusercontent.com/raysan5/raygui/master/src/raygui.h";

sub check-if-installed {
    my $library_name = 'raylib';
    my $exitcode = shell("pkg-config --exists $library_name").exitcode;
    my $failed = $exitcode == 1;
    die "raylib is isn't installed, please install it" if $failed;

}

sub configure{
    my $raylib-h-file = "resources/raygui.h";
    my $library_name = 'raygui';

    if $*DISTRO.name ~~ /window/ {
        die "Windows is unsupported for now";
    }
    elsif $*DISTRO.name ~~ /macos/ {
        say "Is using macOS";
        check-if-installed;
    }
    else {
        say "Is using Linux";
        check-if-installed;
    }
    say "Downloading raygui from repository...";
    my $result = shell("wget $url -O resources/raygui.h");
    shell("cp resources/raygui.h resources/raygui_modified.c");
    say $raylib-h-file;
    my $srcdir = $*CWD;
    my $output-dir="$srcdir/resources";
    mkdir($output-dir);
    generate-bindings($raylib-h-file, $output-dir);
}

sub install {
    say "Installing Raygui::Bindings";
    my $repo = %*ENV<DESTREPO>
        ?? CompUnit::RepositoryRegistry.repository-for-name(%*ENV<DESTREPO>)
        !! (
            CompUnit::RepositoryRegistry.repository-for-name('site'),
            |$*REPO.repo-chain.grep(CompUnit::Repository::Installable)
        ).first(*.can-install)
        or die "Cannot find a repository to install to";
    say "Installing into $repo";
    my $dist = Distribution::Path.new($*CWD);

    # workaround for missing proper handling of libraries in Distribution::Path
    my $libraygui;
    $dist.meta<files> = (
        |$dist.meta<files>.grep(* ne $libraygui.Str),
        {'resources/libraries/libraygui' => $libraygui},
    );

    $repo.install($dist);
    say "Installed successfully.";
}


sub MAIN(:$install is copy) {
    configure if !$install;
    install if $install;
}
