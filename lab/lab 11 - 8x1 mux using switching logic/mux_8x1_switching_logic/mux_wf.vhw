--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : mux_wf.vhw
-- /___/   /\     Timestamp : Sun Jun 04 23:32:00 2023
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: mux_wf
--Device: Xilinx
--

LIBRARY IEEE;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_1164.All;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY mux_wf IS
END mux_wf;

ARCHITECTURE testbench_arch OF mux_wf IS
    COMPONENT mux8x1_sl
        PORT (
            x : In STD_LOGIC_VECTOR (7 DownTo 0);
            s : In STD_LOGIC_VECTOR (2 DownTo 0);
            sbar : In STD_LOGIC_VECTOR (2 DownTo 0);
            y : Out STD_LOGIC
        );
    END COMPONENT;

    SIGNAL x : STD_LOGIC_VECTOR (7 DownTo 0) := "00000000";
    SIGNAL s : STD_LOGIC_VECTOR (2 DownTo 0) := "000";
    SIGNAL sbar : STD_LOGIC_VECTOR (2 DownTo 0) := "000";
    SIGNAL y : STD_LOGIC := '0';

    BEGIN
        UUT : mux8x1_sl
        PORT MAP (
            x => x,
            s => s,
            sbar => sbar,
            y => y
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                x <= "00000111";
                sbar <= "111";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                x <= "00001111";
                s <= "001";
                sbar <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                x <= "00011111";
                s <= "010";
                sbar <= "101";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                x <= "11111111";
                s <= "011";
                sbar <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                x <= "11101000";
                s <= "100";
                sbar <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                x <= "11101011";
                s <= "101";
                sbar <= "010";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                x <= "01001001";
                s <= "110";
                sbar <= "001";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                x <= "01001010";
                s <= "111";
                sbar <= "000";
                -- -------------------------------------
                -- -------------  Current Time:  900ns
                WAIT FOR 100 ns;
                s <= "010";
                sbar <= "101";
                -- -------------------------------------
                WAIT FOR 100 ns;

            END PROCESS;

    END testbench_arch;

