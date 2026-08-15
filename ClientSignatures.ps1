# =============================================================================
# ClientSignatures.ps1
# -----------------------------------------------------------------------------
# Second detection file, separate from the generic $suspiciousPatterns /
# $cheatStrings lists in Analyzer.ps1.
#
# Purpose: instead of just flagging a mod as generic "SUSPICIOUS", identify
# WHICH cheat client it actually is, by matching on long, distinctive strings
# (full sentences, tooltip text, log/console messages) that are unique enough
# to that specific client's code.
#
# Why full sentences instead of short words:
#   - "AutoTotem" can coincidentally appear in unrelated code / variable names.
#   - "Automatically re-equips your totem when it pops, keeping you alive"
#     essentially only ever appears in one specific client's jar.
#   => fewer false positives, and you get a NAMED result instead of a vague one.
#
# How to add a client:
#   1. Pick 2+ long, verbatim strings you've found specifically in that
#      client's jar (tooltip descriptions, module descriptions, log lines,
#      class names that are unique to it, etc).
#   2. Add them under the client's name below.
#   3. The more strings you add, the more reliable the match — a single
#      matching sentence can still be a coincidence, several together
#      essentially can't be.
#
# Detection rule (implemented in Analyzer.ps1):
#   If a jar contains >= $ClientSignatureThreshold strings from the SAME
#   client entry below, the mod is tagged:
#       🎯 DETECTED CLIENT: <name>
#   instead of / in addition to the generic SUSPICIOUS flag.
# =============================================================================

# Minimum number of matching strings from one client before it counts as identified.
# 2 is a reasonable default — raise it if you get false positives, lower it if
# your strings are already very unique (e.g. long unique sentences).
$ClientSignatureThreshold = 2

$ClientSignatures = [ordered]@{

    "Doomsday" = @(
      var9.append('d');
      var9.append('o');
      var9.append('o');
      var9.append('m');
      var9.append('s');
      var9.append('d');
      var9.append('a');
      var9.append('y');
      var9.append('a');
      var9.append('r');
      var9.append('g');
      var9.append('s');
      var9.append('=');
    )

    "Prestige" = @(
        # TODO
    )

    "Xenon" = @(
        # TODO
    )

    "Asteria" = @(
        # TODO
    )

    # Add more clients as you research them...
}
