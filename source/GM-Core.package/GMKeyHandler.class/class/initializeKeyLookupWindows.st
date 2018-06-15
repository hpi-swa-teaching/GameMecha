key lookup
initializeKeyLookupWindows
	^ (Dictionary newFrom:
		{16r08 -> Character backspace.
		16r09 -> Character tab.
		16r0D -> Character cr.
		16r1B -> Character escape.
		16r20 -> Character space.
		16r1C -> Character arrowLeft.
		16r1E -> Character arrowUp.
		16r1D -> Character arrowRight.
		16r1F -> Character arrowDown.
		16r60 -> $0.
		16r61 -> $1.
		16r62 -> $2.
		16r63 -> $3.
		16r64 -> $4.
		16r65 -> $5.
		16r66 -> $6.
		16r67 -> $7.
		16r68 -> $8.
		16r69 -> $9.
		16r41 -> $a.
		16r42 -> $b.
		16r43 -> $c.
		16r44 -> $d.
		16r45 -> $e.
		16r46 -> $f.
		16r47 -> $g.
		16r48 -> $h.
		16r49 -> $i.
		16r4A ->$j.
		16r4B -> $k.
		16r4C -> $l.
		16r4D -> $m.
		16r4E -> $n.
		16r4F -> $o.
		16r50 -> $p.
		16r51 -> $q.
		16r52 -> $r.
		16r53 -> $s.
		16r54 -> $t.
		16r55 -> $u.
		16r56 -> $v.
		16r57 -> $w.
		16r58 -> $x.
		16r59 -> $y.
		16r5A ->$z.		
		})