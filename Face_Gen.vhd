----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 02:53:05 PM
-- Design Name: 
-- Module Name: Face_Gen - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Face_Gen is
Port ( X1, X2, X3, X4, X5, X6 : in std_logic_vector(2 downto 0); --input ports for CU11, CU12, CU13, CU21, CU31
Sel_1, Sel_2, Sel_3, Sel_4, Sel_5, Sel_6, Sel_7, Sel_8, Sel_9 : in std_logic_vector(3 downto 0); --selectors for 8x1 mux(For CU)
C1, C2, C3, C4, C5, C6 : out std_logic_vector(2 downto 0) -- Outputs from the Face
);
end Face_Gen;

architecture Behavioral of Face_Gen is

signal Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10, Y11 : std_logic_vector(2 downto 0); -- outputs of CU


begin

CU1x1: entity work.Mux_16_1(Behavioral)
port map(
A => X1, B => X4, Sel => Sel_1, Y => Y0);

CU1x2: entity work.Mux_16_1(Behavioral)
port map(
A => Y0, B => X5, Sel => Sel_2, Y => Y1);

CU1x3: entity work.Mux_16_1(Behavioral)
port map(
A => Y1, B => X6, Sel => Sel_3, Y => Y2);

CU2x1: entity work.Mux_16_1(Behavioral)
port map(
A => X2, B => Y0, Sel => Sel_4, Y => Y3);

CU2x2: entity work.Mux_16_1(Behavioral)
port map(
A => Y3, B => Y1, Sel => Sel_5, Y => Y4);

CU2x3: entity work.Mux_16_1(Behavioral)
port map(
A => Y4, B => Y2, Sel => Sel_6, Y => Y5);

CU3x1: entity work.Mux_16_1(Behavioral)
port map(
A => X3, B => Y3, Sel => Sel_7, Y => Y6);

CU3x2: entity work.Mux_16_1(Behavioral)
port map(
A => Y6, B => Y4, Sel => Sel_8, Y => Y7);

CU3x3: entity work.Mux_16_1(Behavioral)
port map(
A => Y7, B => Y5, Sel => Sel_9, Y => Y8);

C1 <= Y2;
C2 <= Y5;
C3 <= Y8;
C4 <= Y6;
C5 <= Y7; 
C6 <= Y8;


end Behavioral;
