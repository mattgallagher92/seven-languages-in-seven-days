band_genre(led_zeppelin, hard_rock).
band_genre(pink_floyd, prog_rock).
band_genre(linkin_park, nu_metal).

in_band(jimmy_page, led_zeppelin).
in_band(john_paul_jones, led_zeppelin).
in_band(john_bonham, led_zeppelin).
in_band(nick_mason, pink_floyd).
in_band(roger_waters, pink_floyd).
in_band(richard_wright, pink_floyd).
in_band(mike_shinoda, linkin_park).
in_band(chester_bennington, linkin_park).
in_band(brad_delson, linkin_park).
in_band(dave_farrell, linkin_park).
in_band(joe_hahn, linkin_park).
in_band(rob_bourdon, linkin_park).

plays(david_gilmour, pink_floyd).
plays(jimmy_page, guitar).
plays(john_paul_jones, bass).
plays(john_bonham, drums).
plays(nick_mason, drums).
plays(roger_waters, bass).
plays(richard_wright, keyboards).
plays(david_gilmour, guitar).
plays(mike_shinoda, keyboards).
plays(brad_delson, guitar).
plays(dave_farrell, bass).
plays(rob_bourdon, drums).

musician_genre(X, Y) :- in_band(X, Z), band_genre(Z, Y).

% Find genre of musician (example): `musician_genre(roger_waters, X).`
% Find guitarists: `plays(X, guitar).`
