LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY cash_permutation IS
    GENERIC (
        n : INTEGER := 192 -- message block size (absorbing rate =/= squeezing rate in FKS)
    );
    PORT (
        clk, rst : IN STD_LOGIC;
        msg : IN STD_LOGIC_VECTOR((n - 1) DOWNTO 0);
        o_vld : OUT STD_LOGIC;
        permutation_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0));
END cash_permutation;

ARCHITECTURE permutation_compute OF cash_permutation IS

    TYPE state_type IS (permute, done);
	SIGNAL count : UNSIGNED(7 downto 0);
    SIGNAL state : state_type;
    SIGNAL s_reg : STD_LOGIC_VECTOR((n-1) DOWNTO 0);
    SIGNAL s : STD_LOGIC_VECTOR((n-1) DOWNTO 0);

BEGIN
    s(191) <= s_reg(190);
    s(190) <= s_reg(189);
    s(189) <= s_reg(188);
    s(188) <= s_reg(187);
    s(187) <= s_reg(186);
    s(186) <= s_reg(185);
    s(185) <= s_reg(184);
    s(184) <= s_reg(183);
    s(183) <= s_reg(182);
    s(182) <= s_reg(181);
    s(181) <= s_reg(180);
    s(180) <= (s_reg(179) XOR s_reg(191));
    s(179) <= s_reg(178);
    s(178) <= s_reg(177);
    s(177) <= s_reg(176);
    s(176) <= s_reg(175);
    s(175) <= s_reg(174);
    s(174) <= s_reg(173);
    s(173) <= s_reg(172);
    s(172) <= s_reg(171);
    s(171) <= s_reg(170);
    s(170) <= (s_reg(191) XOR s_reg(169));
    s(169) <= s_reg(168);
    s(168) <= s_reg(167);
    s(167) <= s_reg(166);
    s(166) <= s_reg(165);
    s(165) <= s_reg(164);
    s(164) <= s_reg(163);
    s(163) <= s_reg(162);
    s(162) <= s_reg(161);
    s(161) <= s_reg(160);
    s(160) <= s_reg(159);
    s(159) <= s_reg(158);
    s(158) <= s_reg(157);
    s(157) <= s_reg(156);
    s(156) <= s_reg(155);
    s(155) <= s_reg(154);
    s(154) <= s_reg(153);
    s(153) <= s_reg(152);
    s(152) <= s_reg(151);
    s(151) <= s_reg(150);
    s(150) <= s_reg(149);
    s(149) <= s_reg(148);
    s(148) <= s_reg(147);
    s(147) <= s_reg(146);
    s(146) <= s_reg(145);
    s(145) <= s_reg(144);
    s(144) <= s_reg(143);
    s(143) <= s_reg(142);
    s(142) <= s_reg(141);
    s(141) <= s_reg(140);
    s(140) <= s_reg(139);
    s(139) <= s_reg(138);
    s(138) <= s_reg(137);
    s(137) <= (s_reg(136) XOR s_reg(191));
    s(136) <= s_reg(135);
    s(135) <= s_reg(134);
    s(134) <= s_reg(133);
    s(133) <= s_reg(132);
    s(132) <= s_reg(131);
    s(131) <= s_reg(130);
    s(130) <= s_reg(129);
    s(129) <= s_reg(128);
    s(128) <= s_reg(127);
    s(127) <= s_reg(126);
    s(126) <= s_reg(125);
    s(125) <= s_reg(124);
    s(124) <= s_reg(123);
    s(123) <= s_reg(122);
    s(122) <= s_reg(121);
    s(121) <= s_reg(120);
    s(120) <= s_reg(119);
    s(119) <= s_reg(118);
    s(118) <= s_reg(117);
    s(117) <= s_reg(116);
    s(116) <= s_reg(115);
    s(115) <= s_reg(114);
    s(114) <= s_reg(113);
    s(113) <= s_reg(112);
    s(112) <= s_reg(111);
    s(111) <= s_reg(110);
    s(110) <= s_reg(109);
    s(109) <= s_reg(108);
    s(108) <= s_reg(107);
    s(107) <= s_reg(106);
    s(106) <= s_reg(105);
    s(105) <= s_reg(104);
    s(104) <= s_reg(103);
    s(103) <= s_reg(191);
    s(102) <= s_reg(101);
    s(101) <= s_reg(100);
    s(100) <= s_reg(99);
    
    s(99) <= s_reg(98) XOR ((s_reg(136) AND s_reg(180)) XOR (s_reg(112) AND s_reg(106) AND s_reg(122) AND s_reg(184)) XOR (s_reg(170) AND s_reg(177) AND s_reg(106) AND s_reg(147)) XOR (s_reg(171) AND s_reg(151) AND s_reg(109) AND s_reg(186)));
    
    s(98) <= s_reg(97) XOR ((s_reg(115) AND s_reg(109)) XOR (s_reg(122) AND s_reg(160) AND s_reg(161)) XOR (s_reg(154) AND s_reg(153) AND s_reg(164)) XOR (s_reg(145) AND s_reg(176)));
    s(97) <= s_reg(96);
    
    s(96) <= s_reg(95) XOR ((s_reg(152) AND s_reg(158) AND s_reg(181)) XOR (s_reg(183) AND s_reg(142) AND s_reg(177) AND s_reg(144)));
    s(95) <= s_reg(94);
    
    s(94) <= s_reg(93) XOR ((s_reg(142) AND s_reg(108)) XOR (s_reg(155) AND s_reg(134) AND s_reg(115)));
    
    s(93) <= s_reg(92) XOR ((s_reg(140) AND s_reg(160)) XOR (s_reg(180) AND s_reg(158) AND s_reg(170) AND s_reg(131)) XOR (s_reg(157) AND s_reg(147) AND s_reg(180) AND s_reg(117)) XOR (s_reg(156) AND s_reg(109) AND s_reg(177)));
    s(92) <= s_reg(91);
    s(91) <= s_reg(90);
    s(90) <= s_reg(89);
    
    s(89) <= s_reg(88) XOR ((s_reg(188) AND s_reg(184)) XOR (s_reg(172) AND s_reg(134) AND s_reg(156) AND s_reg(120)) XOR (s_reg(190) AND s_reg(113) AND s_reg(122) AND s_reg(138)) XOR (s_reg(118) AND s_reg(179) AND s_reg(174)));
    
    s(88) <= s_reg(87) XOR ((s_reg(168) AND s_reg(160) AND s_reg(153)) XOR (s_reg(106) AND s_reg(165) AND s_reg(125)) XOR (s_reg(124) AND s_reg(114) AND s_reg(123) AND s_reg(157)) XOR (s_reg(130) AND s_reg(155)));
    
    s(87) <= s_reg(86) XOR ((s_reg(150) AND s_reg(162) AND s_reg(111) AND s_reg(152)) XOR (s_reg(167) AND s_reg(170)) XOR (s_reg(130) AND s_reg(127) AND s_reg(122)) XOR (s_reg(143) AND s_reg(173)));
    s(86) <= (s_reg(102) XOR s_reg(85));
    
    s(85) <= s_reg(84) XOR ((s_reg(166) AND s_reg(163) AND s_reg(180) AND s_reg(135)) XOR (s_reg(147) AND s_reg(157) AND s_reg(183)) XOR (s_reg(109) AND s_reg(166) AND s_reg(184)));
    s(84) <= s_reg(83);
    
    s(83) <= s_reg(82) XOR ((s_reg(158) AND s_reg(182) AND s_reg(128)) XOR (s_reg(174) AND s_reg(118) AND s_reg(109)) XOR (s_reg(124) AND s_reg(159)));
    s(82) <= s_reg(81);
    
    s(81) <= s_reg(80) XOR ((s_reg(121) AND s_reg(104) AND s_reg(170)) XOR (s_reg(187) AND s_reg(107) AND s_reg(130)));
    
    s(80) <= s_reg(79) XOR ((s_reg(129) AND s_reg(148) AND s_reg(121)) XOR (s_reg(137) AND s_reg(152) AND s_reg(142) AND s_reg(166)) XOR (s_reg(142) AND s_reg(159)));
    s(79) <= s_reg(78);
    s(78) <= s_reg(77);
    s(77) <= s_reg(76);
    
    s(76) <= s_reg(75) XOR ((s_reg(156) AND s_reg(174) AND s_reg(171) AND s_reg(131)) XOR (s_reg(185) AND s_reg(182)) XOR (s_reg(189) AND s_reg(109) AND s_reg(142) AND s_reg(170)));
    s(75) <= s_reg(74);
    s(74) <= s_reg(73);
    s(73) <= s_reg(72);
    s(72) <= s_reg(71);
    s(71) <= s_reg(70);
    s(70) <= s_reg(69);
    
    s(69) <= s_reg(68) XOR ((s_reg(169) AND s_reg(117)) XOR (s_reg(162) AND s_reg(172) AND s_reg(190)) XOR (s_reg(157) AND s_reg(160) AND s_reg(178)) XOR (s_reg(152) AND s_reg(133) AND s_reg(115)));
    s(68) <= s_reg(67);
    s(67) <= s_reg(66);
    s(66) <= s_reg(65);
    
    s(65) <= s_reg(64) XOR ((s_reg(131) AND s_reg(118) AND s_reg(136)) XOR (s_reg(182) AND s_reg(153)) XOR (s_reg(181) AND s_reg(120)) XOR (s_reg(119) AND s_reg(106) AND s_reg(175)));
    s(64) <= s_reg(63);
    s(63) <= s_reg(62);
    s(62) <= s_reg(61);
    
    s(61) <= (s_reg(102) XOR s_reg(60)) XOR ((s_reg(175) AND s_reg(115) AND s_reg(147)) XOR (s_reg(162) AND s_reg(126)) XOR (s_reg(162) AND s_reg(159)) XOR (s_reg(173) AND s_reg(149)));
    s(60) <= s_reg(59);
    s(59) <= s_reg(58);
    s(58) <= s_reg(57);
    
    s(57) <= (s_reg(102) XOR s_reg(56)) XOR ((s_reg(191) AND s_reg(183) AND s_reg(106) AND s_reg(165)) XOR (s_reg(187) AND s_reg(146) AND s_reg(178)));
    
    s(56) <= s_reg(55) XOR ((s_reg(149) AND s_reg(160)) XOR (s_reg(191) AND s_reg(176) AND s_reg(151) AND s_reg(171)) XOR (s_reg(140) AND s_reg(104)));
    s(55) <= s_reg(54);
    s(54) <= s_reg(53);
    s(53) <= s_reg(52);
    s(52) <= s_reg(51);
    
    s(51) <= s_reg(50) XOR ((s_reg(160) AND s_reg(181) AND s_reg(113) AND s_reg(154)) XOR (s_reg(188) AND s_reg(114) AND s_reg(184) AND s_reg(123)) XOR (s_reg(108) AND s_reg(122) AND s_reg(139) AND s_reg(188)));
    s(50) <= s_reg(49);
    s(49) <= s_reg(48);
    
    s(48) <= s_reg(47) XOR ((s_reg(118) AND s_reg(159)) XOR (s_reg(178) AND s_reg(138)));
    s(47) <= s_reg(46);
    s(46) <= s_reg(45);
    s(45) <= s_reg(44);
    s(44) <= s_reg(43);
    
    s(43) <= s_reg(42) XOR ((s_reg(118) AND s_reg(133)) XOR (s_reg(130) AND s_reg(107) AND s_reg(116) AND s_reg(135)));
    
    s(42) <= s_reg(102) XOR ((s_reg(178) AND s_reg(154) AND s_reg(182) AND s_reg(118)) XOR (s_reg(119) AND s_reg(176) AND s_reg(104) AND s_reg(111)));
    
    s(41) <= s_reg(40) XOR ((s_reg(77) AND s_reg(44) AND s_reg(46) AND s_reg(45)) XOR (s_reg(44) AND s_reg(72)));
    
    s(40) <= s_reg(39) XOR ((s_reg(100) AND s_reg(79) AND s_reg(58)) XOR (s_reg(53) AND s_reg(52) AND s_reg(75)));
    
    s(39) <= s_reg(38) XOR ((s_reg(79) AND s_reg(47)) XOR (s_reg(66) AND s_reg(59)) XOR (s_reg(69) AND s_reg(89)));
    s(38) <= s_reg(37);
    s(37) <= s_reg(36);
    
    s(36) <= s_reg(35) XOR ((s_reg(82) AND s_reg(78) AND s_reg(95)) XOR (s_reg(96) AND s_reg(100)));
    
    s(35) <= s_reg(34) XOR ((s_reg(95) AND s_reg(62) AND s_reg(100)) XOR (s_reg(58) AND s_reg(90) AND s_reg(77)));
    s(34) <= s_reg(33);
    
    s(33) <= s_reg(32) XOR ((s_reg(79) AND s_reg(100) AND s_reg(60)) XOR (s_reg(71) AND s_reg(45) AND s_reg(46) AND s_reg(86)) XOR (s_reg(89) AND s_reg(60) AND s_reg(54) AND s_reg(42)) XOR (s_reg(60) AND s_reg(55) AND s_reg(67)));
    
    s(32) <= s_reg(31) XOR ((s_reg(88) AND s_reg(54)) XOR (s_reg(97) AND s_reg(81) AND s_reg(101)) XOR (s_reg(75) AND s_reg(49) AND s_reg(58) AND s_reg(87)));
    
    s(31) <= s_reg(30) XOR ((s_reg(80) AND s_reg(42)) XOR (s_reg(75) AND s_reg(100) AND s_reg(87)) XOR (s_reg(76) AND s_reg(48)) XOR (s_reg(51) AND s_reg(99) AND s_reg(61)));
    
    s(30) <= s_reg(29) XOR ((s_reg(68) AND s_reg(89) AND s_reg(100) AND s_reg(83)) XOR (s_reg(97) AND s_reg(102) AND s_reg(79) AND s_reg(90)) XOR (s_reg(44) AND s_reg(84) AND s_reg(70) AND s_reg(49)));
    s(29) <= s_reg(28);
    s(28) <= (s_reg(41) XOR s_reg(27));
    s(27) <= s_reg(26);
    s(26) <= s_reg(25);
    s(25) <= (s_reg(41) XOR s_reg(24));
    s(24) <= (s_reg(41) XOR s_reg(23));
    
    s(23) <= s_reg(41) XOR ((s_reg(78) AND s_reg(98) AND s_reg(77) AND s_reg(66)) XOR (s_reg(55) AND s_reg(86) AND s_reg(69) AND s_reg(42)));
    
    s(22) <= s_reg(21) XOR ((s_reg(40) AND s_reg(41) AND s_reg(26)) XOR (s_reg(34) AND s_reg(39) AND s_reg(28) AND s_reg(27)) XOR (s_reg(37) AND s_reg(41) AND s_reg(26) AND s_reg(23)));
    
    s(21) <= s_reg(20) XOR ((s_reg(29) AND s_reg(27) AND s_reg(36) AND s_reg(30)) XOR (s_reg(27) AND s_reg(23)) XOR (s_reg(34) AND s_reg(36)));
    s(20) <= s_reg(19);
    
    s(19) <= s_reg(18) XOR ((s_reg(26) AND s_reg(35)) XOR (s_reg(39) AND s_reg(40) AND s_reg(27)) XOR (s_reg(35) AND s_reg(28) AND s_reg(39)));
    
    s(18) <= s_reg(17) XOR ((s_reg(41) AND s_reg(23)) XOR (s_reg(24) AND s_reg(40) AND s_reg(25) AND s_reg(38)) XOR (s_reg(36) AND s_reg(34) AND s_reg(24)));
    s(17) <= s_reg(16);
    s(16) <= s_reg(15);
    
    s(15) <= s_reg(14) XOR ((s_reg(29) AND s_reg(28)) XOR (s_reg(37) AND s_reg(41)) XOR (s_reg(39) AND s_reg(27) AND s_reg(30)));
    s(14) <= (s_reg(13) XOR s_reg(22));
    
    s(13) <= (s_reg(12) XOR s_reg(22)) XOR ((s_reg(36) AND s_reg(32)) XOR (s_reg(26) AND s_reg(33)) XOR (s_reg(32) AND s_reg(26) AND s_reg(25)));
    
    s(12) <= s_reg(11) XOR ((s_reg(39) AND s_reg(36) AND s_reg(28) AND s_reg(25)) XOR (s_reg(30) AND s_reg(34)) XOR (s_reg(23) AND s_reg(24)) XOR (s_reg(24) AND s_reg(36)));
    s(11) <= (s_reg(22) XOR s_reg(10));
    s(10) <= s_reg(22);
    
    s(9) <= s_reg(8) XOR ((s_reg(14) AND s_reg(18) AND s_reg(17)) XOR (s_reg(18) AND s_reg(20) AND s_reg(13) AND s_reg(22)));
    s(8) <= s_reg(7);
    
    s(7) <= s_reg(6) XOR ((s_reg(14) AND s_reg(17)) XOR (s_reg(22) AND s_reg(18) AND s_reg(13)) XOR (s_reg(21) AND s_reg(19)) XOR (s_reg(11) AND s_reg(19)));
    s(6) <= s_reg(5);
    
    s(5) <= s_reg(4) XOR ((s_reg(14) AND s_reg(18) AND s_reg(16)) XOR (s_reg(15) AND s_reg(16) AND s_reg(10)) XOR (s_reg(21) AND s_reg(16)));
    
    s(4) <= (s_reg(9) XOR s_reg(3)) XOR ((s_reg(18) AND s_reg(10)) XOR (s_reg(22) AND s_reg(11) AND s_reg(21) AND s_reg(17)) XOR (s_reg(12) AND s_reg(22) AND s_reg(13)) XOR (s_reg(13) AND s_reg(14) AND s_reg(20)));
    
    s(3) <= s_reg(9) XOR ((s_reg(22) AND s_reg(18) AND s_reg(11) AND s_reg(10)) XOR (s_reg(22) AND s_reg(18) AND s_reg(12) AND s_reg(10)) XOR (s_reg(18) AND s_reg(15) AND s_reg(21)) XOR (s_reg(17) AND s_reg(12) AND s_reg(19) AND s_reg(11)));
    
    s(2) <= s_reg(1) XOR ((s_reg(9) AND s_reg(3) AND s_reg(7)) XOR (s_reg(9) AND s_reg(6) AND s_reg(7) AND s_reg(4)) XOR (s_reg(5) AND s_reg(3) AND s_reg(4)) XOR (s_reg(4) AND s_reg(8) AND s_reg(6) AND s_reg(3)));
    s(1) <= (s_reg(2) XOR s_reg(0));
    s(0) <= s_reg(2);
    --s_reg

    PROCESS (rst, clk)
    BEGIN
        -- initialization
        IF (rst = '1') THEN
            s_reg((n-1) DOWNTO 0) <= (OTHERS => '1');
            state <= permute;
            o_vld <= '0';
            count <= (others => '0');
            permutation_out <= (OTHERS => '0');
        ELSIF (clk'event AND clk = '1') THEN
            CASE state IS
                WHEN permute =>
                    o_vld <= '0';
							IF to_integer(count) < 32 THEN -- for each absorbed block, we are clocking the CMPR some amount of times while swapping the internal state periodically
								state <= permute;
								IF to_integer(count) = 0 THEN
									s_reg <= msg XOR s; -- XOR message block and rate portion of internal state (full-state absorption)
								ELSIF to_integer(count) = 8 or to_integer(count) = 16 or to_integer(count) = 24 THEN
									-- Swap upper and lower halves of the state
									s_reg(95 DOWNTO 0) <= s(191 DOWNTO 96);
									s_reg(191 DOWNTO 96) <= s(95 DOWNTO 0);
								ELSE
									s_reg <= s;
								END IF;
								count <= count + 1;
								ELSE
								state <= done;
							END IF;
                WHEN done =>
					permutation_out <= s_reg(63 downto 0);
                    o_vld <= '1';
            END CASE;
        END IF;
    END PROCESS;
END permutation_compute;
