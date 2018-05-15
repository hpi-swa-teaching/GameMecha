class initialization
initializeKeyLookupMac
	^ (Dictionary newFrom:
		{16r00 -> $a.
		16r01 -> $s.
		16r02 -> $d.
		16r03 -> $f.
		16r04 -> $h.
		16r05 -> $g.
		16r06 -> $z.
		16r07 -> $x.
		16r08 -> $c.
		16r09 -> $v.
		16r0B -> $b.
		16r0C -> $q.
		16r0D -> $w.
		16r0E -> $e.
		16r0F -> $r.
		16r10 -> $y.
		16r11 -> $t.
		16r12 -> $1.
		16r13 -> $2.
		16r14 -> $3.
		16r15 -> $4.
		16r16 -> $6.
		16r17 -> $5.
		16r19 -> $9.
		16r1A -> $7.
		16r1C -> $8.
		16r1D -> $0.
		16r1F -> $o.
		16r20 -> $u.
		16r22 -> $i.
		16r23 -> $p.
		16r24 -> Character cr.
		16r25 -> $l.
		16r26 -> $j.
		16r28 -> $k.
		16r2D -> $n.
		16r2E -> $m.
		16r30 -> Character tab.
		16r31 -> Character space.
		16r33 -> Character backspace.
		16r35 -> Character escape.
		16r7B -> Character arrowLeft.
		16r7C -> Character arrowRight.
		16r7D -> Character arrowDown.
		16r7E -> Character arrowUp.
		})