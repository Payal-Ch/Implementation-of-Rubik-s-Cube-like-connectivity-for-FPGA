----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 03:00:17 PM
-- Design Name: 
-- Module Name: TestBench_Full - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBench_Full is
--  Port ( );
end TestBench_Full;

architecture Behavioral of TestBench_Full is


signal As, Bs : std_logic_vector(2 downto 0);
signal Tsels1, Tsels2, Tsels3, Tsels4, Tsels5, Tsels6, Tsels7, Tsels8, Tsels9: std_logic_vector(3 downto 0); -- Selectors for Top Face CUs
signal Fsels1, Fsels2, Fsels3, Fsels4, Fsels5, Fsels6, Fsels7, Fsels8, Fsels9: std_logic_vector(3 downto 0); -- Selectors for Front Face CUs
signal Bsels1, Bsels2, Bsels3, Bsels4, Bsels5, Bsels6, Bsels7, Bsels8, Bsels9: std_logic_vector(3 downto 0); -- Selectors for Bottom Face CUs
signal Rsels1, Rsels2, Rsels3, Rsels4, Rsels5, Rsels6, Rsels7, Rsels8, Rsels9: std_logic_vector(3 downto 0); -- Selectors for Right Face CUs
signal Ksels1, Ksels2, Ksels3, Ksels4, Ksels5, Ksels6, Ksels7, Ksels8, Ksels9: std_logic_vector(3 downto 0); -- Selectors for Back Face CUs
signal Lsels1, Lsels2, Lsels3, Lsels4, Lsels5, Lsels6, Lsels7, Lsels8, Lsels9: std_logic_vector(3 downto 0); -- Selectors for Left Face CUs
signal Couts1, Couts2, Couts3, Couts4, Couts5, Couts6: std_logic_vector(2 downto 0); -- Outputs from RubiksCube
signal Bottoms1, Bottoms2, Bottoms3, Bottoms4, Bottoms5, Bottoms6: std_logic_vector(2 downto 0); -- Outputs from last(Left) Face
signal Sels2x1: std_logic; -- Selector for input to Top Face either externally or internal face output
signal Sels_SP: std_logic; -- Selector for input to Top Face either externally or internal face output

----------------- Testbench Front ----------------------------------
--signal As, Ts4, Ts5, Ts6: std_logic_vector(2 downto 0);
--signal Sels_1, Sels_2, Sels_3, Sels_4, Sels_5, Sels_6, Sels_7, Sels_8, Sels_9: std_logic_vector(3 downto 0); -- selectors for CU
--signal Fs1, Fs2, Fs3, Fs4, Fs5, Fs6 : std_logic_vector(2 downto 0);
---------------------------------------------------------

begin
----------------- Testbench Front ----------------------------------
--CU_3x3: entity work.Face_2_Front(Behavioral)
--port map(A => As, T4 => Ts4, T5 => Ts5, T6 => Ts6, Sel_1 => Sels_1, Sel_2 => Sels_2, Sel_3 => Sels_3, Sel_4 => Sels_4,
-- Sel_5 => Sels_5, Sel_6 => Sels_6, Sel_7 => Sels_7, Sel_8 => Sels_8, Sel_9 => Sels_9, F1 => Fs1, F2 => Fs2, F3 => Fs3, F4 => Fs4,
--  F5 => Fs5, F6 => Fs6);
  ---------------------------------------------------------
 
 ----------------- Testbench TOP + Front ----------------------------------
--RubiksCube: entity work.Rubiks_Cube(Behavioral)
--port map(A => As, B => Bs, 
--Tsel1 => Tsels1, Tsel2 => Tsels2, Tsel3 => Tsels3, Tsel4 => Tsels4, Tsel5 => Tsels5, 
--Tsel6 => Tsels6, Tsel7 => Tsels7, Tsel8 => Tsels8, Tsel9 => Tsels9,
--Fsel1 => Fsels1, Fsel2 => Fsels2, Fsel3 => Fsels3, Fsel4 => Fsels4,
--Fsel5 => Fsels5, Fsel6 => Fsels6, Fsel7 => Fsels7, Fsel8 => Fsels8, Fsel9 => Fsels9,
--Cout1=>Couts1, Cout2=>Couts2, Cout3=>Couts3, Cout4=>Couts4, Cout5=>Couts5, Cout6=>Couts6
-- );
 ---------------------------------------------------------------------------------------

----------------- Testbench TOP + Front + Right ----------------------------------
--RubiksCube: entity work.Rubiks_Cube(Behavioral)
--port map(A => As, B => Bs, 
--Tsel1 => Tsels1, Tsel2 => Tsels2, Tsel3 => Tsels3, Tsel4 => Tsels4, Tsel5 => Tsels5, 
--Tsel6 => Tsels6, Tsel7 => Tsels7, Tsel8 => Tsels8, Tsel9 => Tsels9,
--Fsel1 => Fsels1, Fsel2 => Fsels2, Fsel3 => Fsels3, Fsel4 => Fsels4,
--Fsel5 => Fsels5, Fsel6 => Fsels6, Fsel7 => Fsels7, Fsel8 => Fsels8, Fsel9 => Fsels9,
--Rsel1 => Rsels1, Rsel2 => Rsels2, Rsel3 => Rsels3, Rsel4 => Rsels4, 
--Rsel5 => Rsels5, Rsel6 => Rsels6, Rsel7 => Rsels7, Rsel8 => Rsels8, Rsel9 => Rsels9,
--Cout1=>Couts1, Cout2=>Couts2, Cout3=>Couts3, Cout4=>Couts4, Cout5=>Couts5, Cout6=>Couts6
-- );
---------------------------------------------------------------------------------------

----------------- Testbench TOP + Front + Right + Bottom ----------------------------------
--RubiksCube: entity work.Rubiks_Cube(Behavioral)
--port map(A => As, B => Bs, 
--Tsel1 => Tsels1, Tsel2 => Tsels2, Tsel3 => Tsels3, Tsel4 => Tsels4, Tsel5 => Tsels5, 
--Tsel6 => Tsels6, Tsel7 => Tsels7, Tsel8 => Tsels8, Tsel9 => Tsels9,
--Fsel1 => Fsels1, Fsel2 => Fsels2, Fsel3 => Fsels3, Fsel4 => Fsels4,
--Fsel5 => Fsels5, Fsel6 => Fsels6, Fsel7 => Fsels7, Fsel8 => Fsels8, Fsel9 => Fsels9,
--Rsel1 => Rsels1, Rsel2 => Rsels2, Rsel3 => Rsels3, Rsel4 => Rsels4, 
--Rsel5 => Rsels5, Rsel6 => Rsels6, Rsel7 => Rsels7, Rsel8 => Rsels8, Rsel9 => Rsels9,
--Bsel1 => Bsels1, Bsel2 => Bsels2, Bsel3 => Bsels3, Bsel4 => Bsels4, 
--Bsel5 => Bsels5, Bsel6 => Bsels6, Bsel7 => Bsels7, Bsel8 => Bsels8, Bsel9 => Bsels9,
--Cout1=>Couts1, Cout2=>Couts2, Cout3=>Couts3, Cout4=>Couts4, Cout5=>Couts5, Cout6=>Couts6
-- );
---------------------------------------------------------------------------------------

----------------- Testbench TOP + Front + Right + Bottom + Back ----------------------------------
--RubiksCube: entity work.Rubiks_Cube(Behavioral)
--port map(A => As, B => Bs, 
--Tsel1 => Tsels1, Tsel2 => Tsels2, Tsel3 => Tsels3, Tsel4 => Tsels4, Tsel5 => Tsels5, 
--Tsel6 => Tsels6, Tsel7 => Tsels7, Tsel8 => Tsels8, Tsel9 => Tsels9,
--Fsel1 => Fsels1, Fsel2 => Fsels2, Fsel3 => Fsels3, Fsel4 => Fsels4,
--Fsel5 => Fsels5, Fsel6 => Fsels6, Fsel7 => Fsels7, Fsel8 => Fsels8, Fsel9 => Fsels9,
--Rsel1 => Rsels1, Rsel2 => Rsels2, Rsel3 => Rsels3, Rsel4 => Rsels4, 
--Rsel5 => Rsels5, Rsel6 => Rsels6, Rsel7 => Rsels7, Rsel8 => Rsels8, Rsel9 => Rsels9,
--Bsel1 => Bsels1, Bsel2 => Bsels2, Bsel3 => Bsels3, Bsel4 => Bsels4, 
--Bsel5 => Bsels5, Bsel6 => Bsels6, Bsel7 => Bsels7, Bsel8 => Bsels8, Bsel9 => Bsels9,
--Ksel1 => Ksels1, Ksel2 => Ksels2, Ksel3 => Ksels3, Ksel4 => Ksels4, 
--Ksel5 => Ksels5, Ksel6 => Ksels6, Ksel7 => Ksels7, Ksel8 => Ksels8, Ksel9 => Ksels9,
--Cout1=>Couts1, Cout2=>Couts2, Cout3=>Couts3, Cout4=>Couts4, Cout5=>Couts5, Cout6=>Couts6
-- );
---------------------------------------------------------------------------------------

----------------- Testbench TOP + Front + Right + Bottom + Back + Left ----------------------------------
RubiksCube: entity work.Rubiks_Cube(Behavioral)
port map(A => As, B => Bs, 
Tsel1 => Tsels1, Tsel2 => Tsels2, Tsel3 => Tsels3, Tsel4 => Tsels4, Tsel5 => Tsels5, 
Tsel6 => Tsels6, Tsel7 => Tsels7, Tsel8 => Tsels8, Tsel9 => Tsels9,
Fsel1 => Fsels1, Fsel2 => Fsels2, Fsel3 => Fsels3, Fsel4 => Fsels4,
Fsel5 => Fsels5, Fsel6 => Fsels6, Fsel7 => Fsels7, Fsel8 => Fsels8, Fsel9 => Fsels9,
Rsel1 => Rsels1, Rsel2 => Rsels2, Rsel3 => Rsels3, Rsel4 => Rsels4, 
Rsel5 => Rsels5, Rsel6 => Rsels6, Rsel7 => Rsels7, Rsel8 => Rsels8, Rsel9 => Rsels9,
Bsel1 => Bsels1, Bsel2 => Bsels2, Bsel3 => Bsels3, Bsel4 => Bsels4, 
Bsel5 => Bsels5, Bsel6 => Bsels6, Bsel7 => Bsels7, Bsel8 => Bsels8, Bsel9 => Bsels9,
Ksel1 => Ksels1, Ksel2 => Ksels2, Ksel3 => Ksels3, Ksel4 => Ksels4, 
Ksel5 => Ksels5, Ksel6 => Ksels6, Ksel7 => Ksels7, Ksel8 => Ksels8, Ksel9 => Ksels9,
Lsel1 => Lsels1, Lsel2 => Lsels2, Lsel3 => Lsels3, Lsel4 => Lsels4, 
Lsel5 => Lsels5, Lsel6 => Lsels6, Lsel7 => Lsels7, Lsel8 => Lsels8, Lsel9 => Lsels9,
Cout1=>Couts1, Cout2=>Couts2, Cout3=>Couts3, Cout4=>Couts4, Cout5=>Couts5, Cout6=>Couts6,
Bottom1 => Bottoms1, Bottom2 => Bottoms2, Bottom3 => Bottoms3,
Bottom4 => Bottoms4, Bottom5 => Bottoms5, Bottom6 => Bottoms6,
Sel2x1 => Sels2x1, Sel_SP => Sels_SP
 );
---------------------------------------------------------------------------------------

stim: process
begin

------------------------------------ Testcase 1 --------------------------------
--As <= "101"; Bs <= "011"; Sels2x1 <= '0'; Sels_SP <= '0';
--Tsels1 <= "0010" ; Tsels2 <= "0000" ; Tsels3 <= "0111" ; Tsels4 <= "0101" ; Tsels5 <= "1010" ;
-- Tsels6 <= "1011" ; Tsels7 <= "1000" ; Tsels8 <= "1001" ; Tsels9 <= "0001" ;
-- --wait for 5 ns;
--Fsels1 <= "0010" ; Fsels2 <= "0000" ; Fsels3 <= "0111" ; Fsels4 <= "0011" ; Fsels5 <= "1001" ;
-- Fsels6 <= "1010" ; Fsels7 <= "0110" ; Fsels8 <= "1100" ; Fsels9 <= "1011" ;
 
-- Rsels1 <= "0010"; Rsels2 <= "0000"; Rsels3 <= "0111"; Rsels4 <= "0100"; Rsels5 <= "0011";
-- Rsels6 <= "1001"; Rsels7 <= "1010"; Rsels8 <= "0110"; Rsels9 <= "1100";
 
-- Bsels1 <= "0010"; Bsels2 <= "0000"; Bsels3 <= "0111"; Bsels4 <= "1010"; Bsels5 <= "1011";
-- Bsels6 <= "1000"; Bsels7 <= "1001"; Bsels8 <= "0001"; Bsels9 <= "0101";
 
--Ksels1 <= "0010"; Ksels2 <= "0000"; Ksels3 <= "0111"; Ksels4 <= "1011"; Ksels5 <= "0100";
-- Ksels6 <= "1010"; Ksels7 <= "0101"; Ksels8 <= "0011"; Ksels9 <= "1000";  
 
--Lsels1 <= "0010"; Lsels2 <= "0000"; Lsels3 <= "0111"; Lsels4 <= "0011"; Lsels5 <= "0001";
-- Lsels6 <= "1001"; Lsels7 <= "1010"; Lsels8 <= "1011"; Lsels9 <= "0110";  

--wait for 15 ns;  
--------------------------------------------------------------------------------

---------------------------------- Testcase 2 -------------------------------- 
--As <= "010"; Bs <= "101"; Sels2x1 <= '1'; Sels_SP <= '0';
--Tsels1 <= "0010" ; Tsels2 <= "0000" ; Tsels3 <= "0111" ; Tsels4 <= "0110" ; Tsels5 <= "1100" ;
-- Tsels6 <= "1011" ; Tsels7 <= "1000" ; Tsels8 <= "0011" ; Tsels9 <= "1001" ;
-- --wait for 5 ns;
--Fsels1 <= "0010" ; Fsels2 <= "0000" ; Fsels3 <= "0111" ; Fsels4 <= "0101" ; Fsels5 <= "0110" ;
-- Fsels6 <= "1010" ; Fsels7 <= "0100" ; Fsels8 <= "0001" ; Fsels9 <= "1100" ;
 
-- Rsels1 <= "0010"; Rsels2 <= "0000"; Rsels3 <= "0111"; Rsels4 <= "0001"; Rsels5 <= "1001";
-- Rsels6 <= "1011"; Rsels7 <= "0011"; Rsels8 <= "0100"; Rsels9 <= "1000";
 
-- Bsels1 <= "0010"; Bsels2 <= "0000"; Bsels3 <= "0111"; Bsels4 <= "1011"; Bsels5 <= "0001";
-- Bsels6 <= "0101"; Bsels7 <= "1000"; Bsels8 <= "1001"; Bsels9 <= "0011";
 
--Ksels1 <= "0010"; Ksels2 <= "0000"; Ksels3 <= "0111"; Ksels4 <= "1010"; Ksels5 <= "1011";
-- Ksels6 <= "1100"; Ksels7 <= "0101"; Ksels8 <= "0011"; Ksels9 <= "0110";  
 
--Lsels1 <= "0010"; Lsels2 <= "0000"; Lsels3 <= "0111"; Lsels4 <= "0001"; Lsels5 <= "1100";
-- Lsels6 <= "1010"; Lsels7 <= "1011"; Lsels8 <= "0110"; Lsels9 <= "1000"; 
   
--wait for 15 ns;
------------------------------------------------------------------------------

---------------------------------- Testcase 3 --------------------------------
--As <= "110"; Bs <= "001"; Sels2x1 <= '0'; Sels_SP <= '0';
--Tsels1 <= "0010" ; Tsels2 <= "0000" ; Tsels3 <= "0111" ; Tsels4 <= "0101" ; Tsels5 <= "1010" ;
-- Tsels6 <= "1011" ; Tsels7 <= "1000" ; Tsels8 <= "1001" ; Tsels9 <= "0001" ;
-- --wait for 5 ns;
--Fsels1 <= "0010" ; Fsels2 <= "0000" ; Fsels3 <= "0111" ; Fsels4 <= "0011" ; Fsels5 <= "1001" ;
-- Fsels6 <= "1010" ; Fsels7 <= "0110" ; Fsels8 <= "1100" ; Fsels9 <= "1011" ;
 
-- Rsels1 <= "0010"; Rsels2 <= "0000"; Rsels3 <= "0111"; Rsels4 <= "0100"; Rsels5 <= "0011";
-- Rsels6 <= "1001"; Rsels7 <= "1010"; Rsels8 <= "0110"; Rsels9 <= "1100";
 
-- Bsels1 <= "0010"; Bsels2 <= "0000"; Bsels3 <= "0111"; Bsels4 <= "1010"; Bsels5 <= "1011";
-- Bsels6 <= "1000"; Bsels7 <= "1001"; Bsels8 <= "0001"; Bsels9 <= "0101";
 
--Ksels1 <= "0010"; Ksels2 <= "0000"; Ksels3 <= "0111"; Ksels4 <= "1011"; Ksels5 <= "0100";
-- Ksels6 <= "1010"; Ksels7 <= "0101"; Ksels8 <= "0011"; Ksels9 <= "1000";  
 
--Lsels1 <= "0010"; Lsels2 <= "0000"; Lsels3 <= "0111"; Lsels4 <= "0011"; Lsels5 <= "0001";
-- Lsels6 <= "1001"; Lsels7 <= "1010"; Lsels8 <= "1011"; Lsels9 <= "0110";  

--wait for 15 ns;  
------------------------------------------------------------------------------

---------------------------------- Testcase 4 -------------------------------- 
--As <= "100"; Bs <= "111"; Sels2x1 <= '1'; Sels_SP <= '0';
--Tsels1 <= "0010" ; Tsels2 <= "0000" ; Tsels3 <= "0111" ; Tsels4 <= "0110" ; Tsels5 <= "1100" ;
-- Tsels6 <= "1011" ; Tsels7 <= "1000" ; Tsels8 <= "0011" ; Tsels9 <= "1001" ;
-- --wait for 5 ns;
--Fsels1 <= "0010" ; Fsels2 <= "0000" ; Fsels3 <= "0111" ; Fsels4 <= "0101" ; Fsels5 <= "0110" ;
-- Fsels6 <= "1010" ; Fsels7 <= "0100" ; Fsels8 <= "0001" ; Fsels9 <= "1100" ;
 
-- Rsels1 <= "0010"; Rsels2 <= "0000"; Rsels3 <= "0111"; Rsels4 <= "0001"; Rsels5 <= "1001";
-- Rsels6 <= "1011"; Rsels7 <= "0011"; Rsels8 <= "0100"; Rsels9 <= "1000";
 
-- Bsels1 <= "0010"; Bsels2 <= "0000"; Bsels3 <= "0111"; Bsels4 <= "1011"; Bsels5 <= "0001";
-- Bsels6 <= "0101"; Bsels7 <= "1000"; Bsels8 <= "1001"; Bsels9 <= "0011";
 
--Ksels1 <= "0010"; Ksels2 <= "0000"; Ksels3 <= "0111"; Ksels4 <= "1010"; Ksels5 <= "1011";
-- Ksels6 <= "1100"; Ksels7 <= "0101"; Ksels8 <= "0011"; Ksels9 <= "0110";  
 
--Lsels1 <= "0010"; Lsels2 <= "0000"; Lsels3 <= "0111"; Lsels4 <= "0001"; Lsels5 <= "1100";
-- Lsels6 <= "1010"; Lsels7 <= "1011"; Lsels8 <= "0110"; Lsels9 <= "1000"; 
   
--wait for 15 ns;
------------------------------------------------------------------------------

-------------------------------- Testcase 5 -- Shortest Path -------------------------------- 
As <= "100"; Bs <= "010"; Sels2x1 <= '0'; Sels_SP <= '1';
Tsels1 <= "0010" ; Tsels2 <= "0000" ; Tsels3 <= "0111" ; Tsels4 <= "0001" ; Tsels5 <= "1000" ;
 Tsels6 <= "1010" ; Tsels7 <= "0011" ; Tsels8 <= "1100" ; Tsels9 <= "1001" ;
 --wait for 5 ns;
Fsels1 <= "0010" ; Fsels2 <= "0000" ; Fsels3 <= "0111" ; Fsels4 <= "0110" ; Fsels5 <= "0101" ;
 Fsels6 <= "1000" ; Fsels7 <= "1011" ; Fsels8 <= "1001" ; Fsels9 <= "1010" ;
 
-- Rsels1 <= "0010"; Rsels2 <= "0000"; Rsels3 <= "0111"; Rsels4 <= "0001"; Rsels5 <= "1001";
-- Rsels6 <= "1011"; Rsels7 <= "0011"; Rsels8 <= "0100"; Rsels9 <= "1000";
 
 Bsels1 <= "0010"; Bsels2 <= "0000"; Bsels3 <= "0111"; Bsels4 <= "0110"; Bsels5 <= "0001";
 Bsels6 <= "1011"; Bsels7 <= "1100"; Bsels8 <= "0011"; Bsels9 <= "0100";
 
--Ksels1 <= "0010"; Ksels2 <= "0000"; Ksels3 <= "0111"; Ksels4 <= "1010"; Ksels5 <= "1011";
-- Ksels6 <= "1100"; Ksels7 <= "0101"; Ksels8 <= "0011"; Ksels9 <= "0110";  
 
--Lsels1 <= "0010"; Lsels2 <= "0000"; Lsels3 <= "0111"; Lsels4 <= "0001"; Lsels5 <= "1100";
-- Lsels6 <= "1010"; Lsels7 <= "1011"; Lsels8 <= "0110"; Lsels9 <= "1000"; 
   
wait for 15 ns;
----------------------------------------------------------------------------
finish;
end process;

end Behavioral;
