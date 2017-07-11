as yet unclassified
macMapping
	^ {
		16r35 -> Character escape.
		
		"row per row from the old mac layout"
		"---main block start---"
		
		16r0A -> $^.
		16r12 -> $1.
		16r13 -> $2.
		16r14 -> $3.
		16r15 -> $4.
		16r16 -> $6.
		16r1A -> $7.
		16r1C -> $8.
		16r19 -> $9.
		16r1D -> $0.
		16r1B -> $ß.
		16r18 -> $'.
		16r33 -> Character delete.
		
		16r30 -> Character tab.
		16r0C -> $Q.
		16r0D -> $W.
		16r0E -> $E.
		16r0F -> $R.
		16r11 -> $T.
		16r10 -> $Z.
		16r20 -> $U.
		16r22 -> $I.
		16r1F -> $O.
		16r23 -> $P.
		16r21 -> $Ü.
		16r1E -> $*.
		
		16r39 -> Character value: 0. "TODO: caps"
		16r00 -> $A.
		16r01 -> $S.
		16r02 -> $D.
		16r03 -> $F.
		16r05 -> $G.
		16r04 -> $H.
		16r26 -> $J.
		16r28 -> $K.
		16r25 -> $L.
		16r29 -> $Ö.
		16r27 -> $Ä.
		16r2A -> $#. "TODO: is this right?"
		16r24 -> Character cr.
		
		16r38 -> self keyShift asCharacter.
		16r32 -> $<.
		16r06 -> $Y.
		16r07 -> $X.
		16r08 -> $C.
		16r09 -> $V.
		16r0B -> $B.
		16r2D -> $N.
		16r2E -> $M.
		16r2B -> $,.
		16r2F -> $..
		16r2C -> $-.
		"shift again"
		
		16r3B -> self keyControl asCharacter.
		"windows key"
		16r37 -> self keyAlt asCharacter.
		16r31 -> Character space.
		"alt-Gr"
		"rightClick"
		"control again"
		
		"---main block end---"
		
		
		16r72 -> Character insert.
		16r73 -> Character home.
		16r74 -> Character pageUp.
		16r75 -> Character delete.
		16r77-> Character end.
		16r79 -> Character pageDown.
		
		16r7E -> Character arrowUp.
		16r7B -> Character arrowLeft.
		16r7D -> Character arrowDown.
		16r7C -> Character arrowRight.
		
		"numblock"
		16r47 -> Character value: 0. "TODO: num-lock"
		16r51 -> $/.
		16r4B -> $*.
		16r43 -> $-.
		16r52 -> $0.
		16r53 -> $1.
		16r54 -> $2.
		16r55 -> $3.
		16r56 -> $4.
		16r57 -> $5.
		16r58 -> $6.
		16r59 -> $7.
		16r5B -> $8.
		16r5C -> $9.
		16r41 -> $,.
		16r45 -> $+. "TODO: maybe 4E instead"
		16r4C -> Character cr.
	} asDictionary.