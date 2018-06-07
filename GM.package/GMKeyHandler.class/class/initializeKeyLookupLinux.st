class initialization
initializeKeyLookupLinux
	^ (Dictionary newFrom:
		{
		8 -> Character backspace.
		9 -> Character tab.
		13 -> Character cr.
		27 -> Character escape.
		28 -> Character arrowLeft.
		29 -> Character arrowRight.
		30 -> Character arrowUp.
		31 -> Character arrowDown.
		32 -> Character space.
		49 -> $1.
		50 -> $2.
		51 -> $3.
		52 -> $4.
		53 -> $5.
		54 -> $6.
		55 -> $7.
		56 -> $8.
		57 -> $9.
		48 -> $0.
		97 -> $a.
		98 -> $b.
		99 -> $c.
		100 -> $d.
		101 -> $e.
		102 -> $f.
		103 -> $g.
		104 -> $h.
		105 -> $i.
		106 -> $j.
		107 -> $k.
		108 -> $l.
		109 -> $m.
		110 -> $n.
		111 -> $o.
		112 -> $p.
		113 -> $q.
		114 -> $r.
		16r73 -> $s.
		116 -> $t.
		117 -> $u.
		118 -> $v.
		119 -> $w.
		120 -> $x.
		121 -> $y.
		122 -> $z.
		})