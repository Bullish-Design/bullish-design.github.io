# Development environment of bullish-design.github.io.
{ pkgs, ... }:
{
  packages = [ pkgs.git ];

  # Testee runs the standard tasks (check:*, test:*).
  # Every task declares `input.testee`, so Testee can reuse a verdict when a commit
  # changes none of its inputs. Run `testee doctor` after any edit to this table.
  # devman's `base` group calls `base:check` and `base:test`.
  # Siteman builds and checks the Hugo site.
  tasks = {
    "check:lint" = {
      exec = ''
        set -eu
        cd "$DEVENV_ROOT"
        siteman-check
      '';
      input.testee.reads = [
        "README.md"
        "content/**"
        ".siteman/**"
        "static/**"
        "assets/**"
        ".github/workflows/**"
        ".gitignore"
        "go.mod"
        "go.sum"
        "_vendor/**"
      ];
    };

    "check:format" = {
      exec = ''
        set -eu
        cd "$DEVENV_ROOT"
        # Every tracked file is text (grep -I rejects a binary file).
        bad=0
        for f in $(git ls-files); do
          if [ -f "$f" ] && [ -s "$f" ] && ! grep -Iq . "$f"; then
            echo "not text: $f"
            bad=1
          fi
        done
        exit "$bad"
      '';
      input.testee.ignores = [ ".gitignore" ];
    };

    "check:types" = {
      exec = ''
        echo "n/a: static Hugo site: no typed language"
        exit 0
      '';
      input.testee.ignores = [ "**" ];
    };

    "test:quick" = {
      exec = ''
        set -eu
        cd "$DEVENV_ROOT"
        siteman-build
      '';
      input.testee.reads = [
        "content/**"
        ".siteman/**"
        "static/**"
        "assets/**"
        "go.mod"
        "go.sum"
        "_vendor/**"
      ];
    };

    "test:full" = {
      exec = ''
        echo "n/a: static site: no browser test suite"
        exit 0
      '';
      input.testee.ignores = [ "**" ];
    };

    "base:check" = {
      after = [ "check:lint" "check:format" "check:types" ];
      input.testee.ignores = [ "**" ];
    };
    "base:test" = {
      after = [ "test:full" ];
      input.testee.ignores = [ "**" ];
    };
  };
}
