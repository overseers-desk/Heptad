# Keyboard Layout Distribution Survey

A survey of how open-source alternative keyboard-layout projects are distributed and licensed, run on 2026-07-03 to inform Heptad's own delivery and its cross-platform release plan. It enumerated 128 repositories across the Alt Keyboard Layouts (AKL) community indexes (getreuer's guide, GalileoBlues Layout-Wiki, layouts.wiki, cyanophage), GitHub topic pages, and dedicated macOS, Windows, and international sources, then inspected each repository's releases and license. The count is of repositories, not distinct layouts: forks and re-implementations appear separately, so the 128 repositories represent roughly 60 to 70 distinct layouts.

## Method

Six discovery agents (one per angle: AKL-ergonomic, GitHub-topics, macOS, Windows, international/national, aggregator lists) enumerated candidate projects. Each project was then fetched by a cataloguing agent that read its GitHub/GitLab releases page and README to classify delivery as a ready-to-install package or as source-only. Licences were read separately and deterministically from the GitHub API (`license.spdx_id`), not inferred. Model: Sonnet for discovery and cataloguing; GitHub API for licences.

## Headline findings

- **Packaging is a Windows and macOS phenomenon; Linux is not.** 57 of 128 repositories ship a ready-to-install package; 71 are source-only. Format frequency across packaged projects: exe 30, msi 23, keylayout-bundle 21, dmg 14, brew 4, AUR 2, pkg 2, choco 2, deb 2, rpm 1.
- **No Linux-native XKB layout in the survey ships as a `.deb`.** The only two `.deb` entries are `qwerty-fr` (which also offers AUR) and `oxeylyzer`, and the latter is a layout *analyzer* application, not a keyboard layout. Linux layouts are delivered almost universally as raw XKB files copied into place or applied by a small script, which is exactly Heptad's method.
- **Most repositories carry no licence.** none: 67, MIT: 23, GPL-3.0: 17, custom/other: 6, Apache-2.0: 5, Unlicense: 3, non-repo site: 3, CC0-1.0: 2, gist: 1, BSD-2-Clause: 1. A repository with no licence file is, by default copyright, all-rights-reserved despite its source being public; reuse is not granted.

## Why Heptad is Linux-only today, and what a cross-platform release requires

Heptad is intended to be used on every platform, not only Linux. Its present Linux/XKB-only scope is an artefact of where it was first written, not a design decision. Recording the obstacle here so the intent is not mistaken for a limit:

Heptad's defining feature, the math layers on levels 5 to 7 (italic, superscript, and subscript letters), hangs off the Super (Windows/Command) key. Native Windows keyboard layouts built with the Microsoft Keyboard Layout Creator do not treat the Windows key as a character modifier at all; they offer only base, Shift, AltGr, and Shift+AltGr states. macOS `.keylayout` files expose Option as an AltGr-equivalent (covering levels 3 and 4) but not a second Command-based character layer without colliding with system shortcuts. A native port on either platform therefore reproduces the US base and the AltGr accent layers but drops the Super math layers, which are most of the reason Heptad exists.

Release plan for parity beyond Linux:

1. **Native layer where it fits.** Ship an MSKLC layout on Windows and a Ukelele `.keylayout`/`.bundle` on macOS covering the US base and the AltGr accent layers (levels 1 to 4). These are packageable as `.exe`/`.msi` (Windows) and `.dmg` or Homebrew cask (macOS), matching how the surveyed cross-platform layouts ship.
2. **Remapper for the math layers.** Deliver the Super-based levels 5 to 7 through a key-remapper that can bind the Windows/Command key to character output: AutoHotkey or kanata on Windows, Karabiner-Elements on macOS. Several surveyed multi-layer layouts (Colemak-DH, Canary) already ship `.ahk` for this reason.
3. **Single source, generated outputs.** The same key map would otherwise live in three unrelated formats (XKB, MSKLC `.klc`, macOS `.keylayout`) and drift; the survey shows this happening in practice (Gallium's Windows and macOS packages are marked out of date against its own layout). A serious cross-platform Heptad should generate all three formats from one description rather than maintain three copies by hand.

## Full list

`Package` = ships a ready-to-install installer/bundle. `License`: SPDX id where present; `none` = no licence file (all-rights-reserved by default); `custom/other` = a licence file GitHub could not match to an SPDX id.

### Packaged (57)

| Layout | Host | Package | Format(s) | License |
|---|---|---|---|---|
| [apemangr/programmer-dvorak-no-atm](https://github.com/apemangr/programmer-dvorak-no-atm) | GitHub | yes | exe | GPL-3.0 |
| [arwn/colemak-dh-windows](https://github.com/arwn/colemak-dh-windows) | GitHub | yes | msi/exe | none |
| [axsk/ColemakDH](https://github.com/axsk/ColemakDH) | GitHub | yes | msi/exe | none |
| [BEAKL-15p](https://github.com/sunaku/beakl15p) | GitHub | yes | msi/exe | none |
| [bepo (mnapoli)](https://github.com/mnapoli/bepo) | GitHub | yes | msi/exe/keylayout-bundle | none |
| [bepo-iso (benjaminbellamy)](https://github.com/benjaminbellamy/bepo-iso) | GitHub | yes | keylayout-bundle | none |
| [Bone](https://github.com/nightscape/bone_keyboard_layout) | GitHub | yes | exe | none |
| [BvoFrak](https://github.com/leonardoce/arensito/tree/master/bvofrak) | GitHub | yes | msi/exe | none |
| [Canaria (christoofar/canaria)](https://github.com/christoofar/canaria) | GitHub | yes | msi/exe/dmg | Unlicense |
| [Canary](https://github.com/Apsu/Canary) | GitHub | yes | dmg/exe | MIT |
| [cf-keylayout (ergosteur)](https://github.com/ergosteur/cf-keylayout) | GitHub | yes | brew | none |
| [Colemak DH Keyboard Layout (bdevos)](https://github.com/bdevos/colemak-dh-keyboard-layout) | GitHub | yes | keylayout-bundle | none |
| [Colemak-DH (Mod-DH)](https://github.com/ColemakMods/mod-dh) | GitHub | yes | msi/keylayout-bundle/brew/AUR | CC0-1.0 |
| [Colemak-DHm](https://github.com/narze/Colemak-DHm) | GitHub | yes | keylayout-bundle | none |
| [colemak-se](https://github.com/motform/colemak-se) | GitHub | yes | dmg/exe/keylayout-bundle | GPL-3.0 |
| [colemak-win](https://github.com/urob/colemak-win) | GitHub | yes | msi/exe | none |
| [Dispo (Qwerty-Lafayette)](https://github.com/fabi1cazenave/qwerty-lafayette) | GitHub | yes | exe/keylayout-bundle | none |
| [DreymaR's Big Bag of Keyboard Tricks / EPKL (DreymaR/BigBagKbdTrixPKL)](https://github.com/DreymaR/BigBagKbdTrixPKL) | GitHub | yes | exe | custom/other |
| [dvorak-alt-intl (soywod)](https://github.com/soywod/dvorak-alt-intl) | GitHub | yes | msi/exe | none |
| [dvorak-qwerty](https://github.com/kentonv/dvorak-qwerty) | GitHub | yes | ? | none |
| [Engram-2021](https://github.com/binarybottle/engram-2021) | GitHub | yes | msi/exe/keylayout-bundle | MIT |
| [engram-en](https://github.com/16hournaps/engram-en) | GitHub | yes | ? | MIT |
| [Engrammer (sunaku/engrammer)](https://github.com/sunaku/engrammer) | GitHub | yes | exe | none |
| [Enthium/EngramMod fork (pguerin3/EngramMod)](https://github.com/pguerin3/EngramMod) | GitHub | yes | msi/exe | none |
| [EurKEY (sonicdoe)](https://github.com/sonicdoe/EurKEY) | GitHub | yes | keylayout-bundle | GPL-3.0 |
| [EurKEY-macOS (mjaschen, fork)](https://github.com/mjaschen/EurKEY-macOS) | GitHub | yes | keylayout-bundle | none |
| [french-nf-azerty-mac (cyril-L)](https://github.com/cyril-L/french-nf-azerty-mac) | GitHub | yes | keylayout-bundle | MIT |
| [French-US-mac-keylayout (thymidin)](https://github.com/thymidin/French-US-mac-keylayout) | GitHub | yes | keylayout-bundle | none |
| [Gallium](https://github.com/GalileoBlues/Gallium) | GitHub | yes | msi/exe/dmg | none |
| [Gallium (fork)](https://github.com/XelorR/Gallium) | GitHub | yes | msi/exe/dmg | none |
| [Gallium v2](https://github.com/seojoon-y/gallium-v2) | GitHub | yes | msi/exe/dmg | none |
| [genkey (Semimak analyzer/generator)](https://github.com/semilin/genkey) | GitHub | yes | ? | GPL-3.0 |
| [Halmak](https://github.com/MadRabbit/halmak) | GitHub | yes | keylayout-bundle | MIT |
| [Halmak](https://github.com/kaievns/halmak) | GitHub | yes | keylayout-bundle | MIT |
| [keyboard-layouts (picturamundi)](https://github.com/picturamundi/keyboard-layouts) | GitHub | yes | keylayout-bundle | none |
| [kingdase/neo2-layout-windows-ahk](https://github.com/kingdase/neo2-layout-windows-ahk) | GitHub | yes | exe | GPL-3.0 |
| [klfc](https://github.com/39aldo39/klfc) | GitHub | yes | ? | GPL-3.0 |
| [macos-keyboard-layout (alexnault)](https://github.com/alexnault/macos-keyboard-layout) | GitHub | yes | keylayout-bundle | none |
| [neo-layout/neo-layout](https://github.com/neo-layout/neo-layout) | GitHub | yes | exe/keylayout-bundle | GPL-3.0 |
| [neo2-layout-osx (jgosmann)](https://github.com/jgosmann/neo2-layout-osx) | GitHub | yes | dmg | GPL-3.0 |
| [Norwegian Extended (norsk-utvidet)](https://github.com/DandelionSprout/norsk-utvidet) | GitHub | yes | msi/exe | custom/other |
| [Norwegian Programmer's Keyboard](https://github.com/torhovland/norwegian-programmers-keyboard) | GitHub | yes | msi/exe | Apache-2.0 |
| [Programmer Dvorak](https://www.kaufmann.no/roland/dvorak/) | other | yes | msi/choco/pkg | non-repo site |
| [qwerty-fr](https://github.com/qwerty-fr/qwerty-fr) | GitHub | yes | deb/pkg/AUR/brew | MIT |
| [Recurva](https://github.com/GalileoBlues/Recurva) | GitHub | yes | dmg | none |
| [Rojetto/ReNeo](https://github.com/Rojetto/ReNeo) | GitHub | yes | ? | GPL-3.0 |
| [Semimak](https://github.com/semilin/semimak) | GitHub | yes | msi/exe/dmg | none |
| [Sturdy (oxeylyzer)](https://github.com/O-X-E-Y/oxeylyzer) | GitHub | yes | deb/rpm/dmg/msi/exe | Apache-2.0 |
| [Sunntig](https://github.com/Freeman999/sunntig) | GitHub | yes | exe/msi | none |
| [Svdvorak](https://github.com/FredrikLindgren/svdvorak) | GitHub | yes | msi/exe | none |
| [Turkish F (Classic)](https://github.com/mehmetkose/f-keyboard) | GitHub | yes | dmg | none |
| [ukrainian-typographic-keyboard](https://github.com/denysdovhan/ukrainian-typographic-keyboard) | GitHub | yes | dmg/keylayout-bundle/brew | MIT |
| [US-Reformed-International](https://github.com/barkloaf/US-Reformed-International) | GitHub | yes | keylayout-bundle | GPL-3.0 |
| [Whorf / Whorfmax](https://github.com/arda-a/Whorfmax) | GitHub | yes | dmg/keylayout-bundle | none |
| [windows-pc-keyboard-layout-mac (skrysm)](https://github.com/skrysm/windows-pc-keyboard-layout-mac) | GitHub | yes | dmg | none |
| [windows-programmer-dvorak-qwerty-ctrl (glibg10b)](https://github.com/glibg10b/windows-programmer-dvorak-qwerty-ctrl) | GitHub | yes | msi/exe | none |
| [Workman](https://github.com/workman-layout/Workman) | GitHub | yes | msi/exe/choco/keylayout-bundle | custom/other |

### Source-only (71)

| Layout | Host | Package | Delivery | License |
|---|---|---|---|---|
| [AdNW](https://github.com/frobiac/adnw) | GitHub | no | source-only | GPL-3.0 |
| [Anymak:END](https://github.com/rpnfan/Anymak) | GitHub | no | source-only | MIT |
| [APTv3](https://github.com/Apsu/APT) | GitHub | no | source-only | CC0-1.0 |
| [armenian-phonetic](https://github.com/vahe-evoyan/armenian-phonetic) | GitHub | no | source-only | none |
| [bepo-code (Zwyx)](https://github.com/Zwyx/bepo-code) | GitHub | no | source-only | MIT |
| [bepo_developpeur (c4software)](https://github.com/c4software/bepo_developpeur) | GitHub | no | source-only | Apache-2.0 |
| [BigBagKbdTrixXKB](https://github.com/DreymaR/BigBagKbdTrixXKB) | GitHub | no | source-only | MIT |
| [colemak (michalzajda, Polish variant)](https://github.com/michalzajda/colemak) | GitHub | no | source-only | none |
| [Colemak (official reference KLC) (davidgrenier)](https://github.com/davidgrenier/Colemak) | GitHub | no | source-only | none |
| [colemak-keyboard-layout-template-macos-catalina (elsanussi-s-mneina)](https://github.com/elsanussi-s-mneina/colemak-keyboard-layout-template-macos-catalina) | GitHub | no | source-only | Unlicense |
| [colemak-qwerty-macos (gkovacs)](https://github.com/gkovacs/colemak-qwerty-macos) | GitHub | no | source-only | none |
| [Colemak.CZ](https://github.com/simi/Colemak.CZ) | GitHub | no | source-only | none |
| [Custom-Semimak](https://github.com/OleAndreasER/custom-semimak) | GitHub | no | source-only | none |
| [czenglish](https://github.com/jistr/czenglish) | GitHub | no | source-only | none |
| [dvorak-is-mac (aldavigdis)](https://github.com/aldavigdis/dvorak-is-mac) | GitHub | no | source-only | none |
| [dvorak-programmer (brandon-northcutt)](https://github.com/brandon-northcutt/dvorak-programmer) | GitHub | no | source-only | MIT |
| [EnDeu](https://github.com/rpnfan/EnDeu) | GitHub | no | source-only | MIT |
| [Engram (binarybottle/engram)](https://github.com/binarybottle/engram) | GitHub | no | source-only | none |
| [Engram-es-2021](https://github.com/binarybottle/engram-es-2021) | GitHub | no | source-only | MIT |
| [Enthium](https://github.com/sunaku/enthium) | GitHub | no | source-only | none |
| [Ergo-L / Ergol](https://github.com/Nuclear-Squid/ergol) | GitHub | no | source-only | custom/other |
| [EurKEY](https://github.com/Tabiskabis/EurKEY) | GitHub | no | source-only | none |
| [EurKEY (vdelau/eurkey, KLFC source)](https://github.com/vdelau/eurkey) | GitHub | no | source-only | GPL-3.0 |
| [EurKEY-clone (pieter-degroote/EurKEY-clone)](https://github.com/pieter-degroote/EurKEY-clone) | GitHub | no | source-only | GPL-3.0 |
| [EurKEY-Mac](https://github.com/jonasdiemer/EurKEY-Mac) | GitHub | no | source-only | none |
| [Fahller (rollbear/keyboard-layout)](https://github.com/rollbear/keyboard-layout) | GitHub | no | source-only | none |
| [Focal](https://github.com/Keyhabit/Focal-keyboard-layout) | GitHub | no | source-only | none |
| [German-Dvorak (sos4nt)](https://github.com/sos4nt/German-Dvorak) | GitHub | no | source-only | none |
| [Gralmak](https://github.com/DreymaR/Gralmak) | GitHub | no | source-only | BSD-2-Clause |
| [Graphite](https://github.com/rdavison/graphite-layout) | GitHub | no | source-only | MIT |
| [Hands Down (Reference/Gold/Neu/Promethium) (snowkeep/hands-down)](https://github.com/snowkeep/hands-down) | GitHub | no | source-only | custom/other |
| [Hands Down Gold (neonfuzz/HandsDown)](https://github.com/neonfuzz/HandsDown) | GitHub | no | source-only | GPL-3.0 |
| [Heptad](https://github.com/overseers-desk/Heptad) | GitHub | no | source-only | none |
| [ISRT (gist by semilin)](https://gist.github.com/semilin/62412be0b185cafa5d95895e11073f2b) | GitHub gist | no | source-only | gist |
| [jeo](https://github.com/ecridge/jeo) | GitHub | no | source-only | Unlicense |
| [keyboard-layouts (xedrac)](https://github.com/xedrac/keyboard-layouts) | GitHub | no | source-only | none |
| [keyboards (rafaelromao)](https://github.com/rafaelromao/keyboards) | GitHub | no | source-only | MIT |
| [KeyDuel](https://github.com/rpnfan/KeyDuel) | GitHub | no | source-only | MIT |
| [knucklehead](https://github.com/minusfive/knucklehead) | GitHub | no | source-only | MIT |
| [KOY](https://github.com/MaxGyver83/koy) | GitHub | no | source-only | Apache-2.0 |
| [macos-keyboard-layout (kirelagin)](https://github.com/kirelagin/macos-keyboard-layout) | GitHub | no | source-only | custom/other |
| [macos-keyboard-layouts (jemrobinson)](https://github.com/jemrobinson/macos-keyboard-layouts) | GitHub | no | source-only | MIT |
| [Magic Roll](https://github.com/Brooklyn-Style/Magic_Roll) | GitHub | no | source-only | none |
| [Magic Sturdy](https://github.com/Ikcelaks/keyboard_layouts/blob/main/magic_sturdy/magic_sturdy.md) | GitHub | no | source-only | none |
| [Magic Sturdy / keyboard_layouts (Ikcelaks)](https://github.com/Ikcelaks/keyboard_layouts) | GitHub | no | source-only | none |
| [Mine](https://neo-layout.org/Layouts/mine/) | other | no | source-only | non-repo site |
| [Miryoku](https://github.com/manna-harbour/miryoku) | GitHub | no | source-only | none |
| [NeoQwertz](https://github.com/andreas-hofmann/neoqwertz) | GitHub | no | source-only | GPL-3.0 |
| [no-dvorak-osx (vibrog)](https://github.com/vibrog/no-dvorak-osx) | GitHub | no | source-only | none |
| [Nordrassil](https://github.com/empressabyss/nordrassil) | GitHub | no | source-only | none |
| [Norwegian Dvorak (nodvorak)](https://github.com/trulfos/nodvorak) | GitHub | no | source-only | none |
| [Noted](https://dariogoetz.github.io/noted-layout/ (source: https://github.com/dariogoetz/noted-layout)) | GitHub | no | source-only | non-repo site |
| [Noted Layout](https://github.com/dariogoetz/noted-layout) | GitHub | no | source-only | GPL-3.0 |
| [Optimot (via OptiCorne repo)](https://github.com/ScriBanana/OptiCorne) | GitHub | no | source-only | none |
| [Portuguese-Native-MAC-OSX-Keyboard-Layout (tacf)](https://github.com/tacf/Portuguese-Native-MAC-OSX-Keyboard-Layout) | GitHub | no | source-only | none |
| [programmer-colemak (aru-py)](https://github.com/aru-py/programmer-colemak) | GitHub | no | source-only | none |
| [programmer-dvorak (typing tutor repo)](https://github.com/denisk20/programmer-dvorak) | GitHub | no | source-only | Apache-2.0 |
| [programmer-dvorak-eu](https://github.com/asvd/programmer-dvorak-eu) | GitHub | no | source-only | none |
| [Programmers Turkish-F](https://github.com/alerque/programmers-turkish-f) | GitHub | no | source-only | GPL-3.0 |
| [Rollla / samuelxyz layouts collection](https://github.com/samuelxyz/layouts) | GitHub | no | source-only | MIT |
| [Rustic](https://github.com/Keyhabit/Rustic-keyboard-layout) | GitHub | no | source-only | none |
| [Spacemak](https://github.com/rpnfan/Spacemak) | GitHub | no | source-only | MIT |
| [spanish-colemak-macos (gkovacs)](https://github.com/gkovacs/spanish-colemak-macos) | GitHub | no | source-only | none |
| [spikespaz/colemak-dh-windows-arm64](https://github.com/spikespaz/colemak-dh-windows-arm64) | GitHub | no | source-only | MIT |
| [Svorak (Swedish Dvorak)](https://github.com/faern/svorak) | GitHub | no | source-only | none |
| [Swedish-Dvorak (svdvorak) for OSX (AlbertVeli)](https://github.com/AlbertVeli/Swedish-Dvorak--svdvorak--for-OSX) | GitHub | no | source-only | none |
| [swolemak](https://github.com/hedeben/swolemak) | GitHub | no | source-only | none |
| [US-German-Keylayout-macOS (dm-z)](https://github.com/dm-z/US-German-Keylayout-macOS) | GitHub | no | source-only | MIT |
| [Vylet](https://github.com/MightyAcas/vylet) | GitHub | no | source-only | none |
| [windows-programmer-dvorak (jayliu50)](https://github.com/jayliu50/windows-programmer-dvorak) | GitHub | no | source-only | none |
| [xkb-birman-layout](https://github.com/isqua/xkb-birman-layout) | GitHub | no | source-only | none |

## Caveats

- A few packaged rows attribute a *tool's* installers to a layout: `oxeylyzer` (listed under Sturdy) and `genkey` (under Semimak) are analyzers whose multi-platform installers were recorded against the layout they analyze. Those layouts are in practice source-only.
- `Package` reflects what each repository ships from its own releases or committed files; a layout with an off-repository package (for example a Keyman keyboard hosted on keyman.com) is recorded as source-only because nothing installable lives in the repository.
- The count is of repositories. Forks, ports, and re-implementations (six EurKEY repositories, three Gallium repositories, two Halmak repositories, several Colemak-DH ports) are listed separately.
- Licence reflects the GitHub-detected `LICENSE` file at survey time. `custom/other` means a licence file exists but is not SPDX-recognised; `none` means no licence file was found.
