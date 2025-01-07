----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 07:38:55 PM
-- Design Name: 
-- Module Name: Rubiks_Cube - Behavioral
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

entity Rubiks_Cube is
  Port (
   A, B :in std_logic_vector(2 downto 0); -- External Inputs
Tsel1, Tsel2, Tsel3, Tsel4, Tsel5, Tsel6, Tsel7, Tsel8, Tsel9: in std_logic_vector(3 downto 0); -- Selectors for Top Face CUs
Fsel1, Fsel2, Fsel3, Fsel4, Fsel5, Fsel6, Fsel7, Fsel8, Fsel9: in std_logic_vector(3 downto 0); -- Selectors for Front Face CUs
Rsel1, Rsel2, Rsel3, Rsel4, Rsel5, Rsel6, Rsel7, Rsel8, Rsel9: in std_logic_vector(3 downto 0); -- Selectors for Right Face CUs
Bsel1, Bsel2, Bsel3, Bsel4, Bsel5, Bsel6, Bsel7, Bsel8, Bsel9: in std_logic_vector(3 downto 0); -- Selectors for Bottom Face CUs
Ksel1, Ksel2, Ksel3, Ksel4, Ksel5, Ksel6, Ksel7, Ksel8, Ksel9: in std_logic_vector(3 downto 0); -- Selectors for Back Face CUs
Lsel1, Lsel2, Lsel3, Lsel4, Lsel5, Lsel6, Lsel7, Lsel8, Lsel9: in std_logic_vector(3 downto 0); -- Selectors for Left Face CUs
Cout1, Cout2, Cout3, Cout4, Cout5, Cout6: out std_logic_vector(2 downto 0); -- Outputs from last(Left) Face
Bottom1, Bottom2, Bottom3, Bottom4, Bottom5, Bottom6: out std_logic_vector(2 downto 0); -- Outputs from Bottom Face
Sel2x1: in std_logic; -- Selctor for 2x1 Mux
Sel_SP: in std_logic -- Selctor for Shortest Path Mux
);
end Rubiks_Cube;

architecture Behavioral of Rubiks_Cube is
signal Tout1, Tout2, Tout3, Tout4, Tout5, Tout6:  std_logic_vector(2 downto 0); -- Internal Outputs - Top Face Outputs
signal Rout1, Rout2, Rout3, Rout4, Rout5, Rout6:  std_logic_vector(2 downto 0); -- Internal Outputs - Right Face Outputs
signal Fout1, Fout2, Fout3, Fout4, Fout5, Fout6:  std_logic_vector(2 downto 0); -- Internal Outputs - Front Face Outputs
signal Bout1, Bout2, Bout3, Bout4, Bout5, Bout6:  std_logic_vector(2 downto 0); -- Internal Outputs - Bottom Face Outputs
signal Kout1, Kout2, Kout3, Kout4, Kout5, Kout6:  std_logic_vector(2 downto 0); -- Internal Outputs - Back Face Outputs
signal Lout1, Lout2, Lout3, Lout4, Lout5, Lout6:  std_logic_vector(2 downto 0); -- Internal Outputs - Left Face Outputs
signal Mout1, Mout2, Mout3:  std_logic_vector(2 downto 0); -- 2x1 Mux(selection for the Top inputs) Outputs
signal SPout1, SPout2, SPout3, SPout4, SPout5, SPout6, SPout7, SPout8, SPout9:  std_logic_vector(2 downto 0); -- Output Selection for Shortest Path/Final Output
--signal Mout4, Mout5, Mout6, Mout7, Mout8, Mout9:  std_logic_vector(2 downto 0);

begin
-- Selection of input to Top face either A(External) or output from Left Face
TCU11_X1_Sel: entity work.Mux2x1(Behavioral)
port map(
P => A, Q => Lout1, Sel => Sel2x1, Y => Mout1);
TCU21_X2_Sel: entity work.Mux2x1(Behavioral)
port map(
P => A, Q => Lout2, Sel => Sel2x1, Y => Mout2);
TCU31_X3_Sel: entity work.Mux2x1(Behavioral)
port map(
P => A, Q => Lout3, Sel => Sel2x1, Y => Mout3);

-- This Piece of Code will workout if we need fully connected Cube, 
-- but since our design requirement is to provide the inputs to the Top face externally, 
-- we have not provided output from Back Face to Top Face
--TCU11_X4_Sel: entity work.Mux2x1(Behavioral)
--port map(
--P => A, Q => Kout3, Sel => Sel2x1, Y => Mout4);
--TCU12_X5_Sel: entity work.Mux2x1(Behavioral)
--port map(
--P => A, Q => Kout2, Sel => Sel2x1, Y => Mout5);
--TCU13_X6_Sel: entity work.Mux2x1(Behavioral)
--port map(
--P => A, Q => Kout1, Sel => Sel2x1, Y => Mout6);

Top_Face: entity work.Face_Gen(Behavioral)
port map(
X1 => Mout1, X2 => Mout2, X3 => Mout3,
--X1 => A, X2 => A, X3 => A, 
-- X4 => Mout4, X5 => Mout5, X6 => Mout6, -- -- fully connected cube
 X4 => B, X5 => B, X6 => B, -- external inputs
sel_1 => Tsel1, sel_2 => Tsel2, sel_3 => Tsel3, sel_4 => Tsel4, sel_5 => Tsel5, 
sel_6 => Tsel6, sel_7 => Tsel7, sel_8 => Tsel8, sel_9 => Tsel9,
C1 => Tout1, C2 => Tout2, C3 => Tout3, C4 => Tout4, C5 => Tout5, C6 => Tout6);

-- This Piece of Code will workout if we need fully connected Cube, 
-- but considering Design requirement for outputs to be shown separately, 
-- we have not provided output from Left Face to Front Face
--FCU11_X1_Sel: entity work.Mux2x1(Behavioral)
--port map(
--P => A, Q => Lout6, Sel => Sel2x1, Y => Mout7);
--FCU21_X2_Sel: entity work.Mux2x1(Behavioral)
--port map(
--P => A, Q => Lout5, Sel => Sel2x1, Y => Mout8);
--FCU31_X3_Sel: entity work.Mux2x1(Behavioral)
--port map(
--P => A, Q => Lout4, Sel => Sel2x1, Y => Mout9);

Front_Face: entity work.Face_Gen(Behavioral)
port map(
--X1 => Mout7, X2 => Mout8, X3 => Mout9, -- fully connected cube
 X1 => A, X2 => A, X3 => A,
 X4 => Tout4, X5 => Tout5, X6 => Tout6,
sel_1 => Fsel1, sel_2 => Fsel2, sel_3 => Fsel3, sel_4 => Fsel4, sel_5 => Fsel5, 
sel_6 => Fsel6, sel_7 => Fsel7, sel_8 => Fsel8, sel_9 => Fsel9,
C1 => Fout1, C2 => Fout2, C3 => Fout3, C4 => Fout4, C5 => Fout5, C6 => Fout6);

Right_Face: entity work.Face_Gen(Behavioral)
Port map (
X1 => Fout1, X2 => Fout2, X3 => Fout3, X4 => Tout3, X5 => Tout2, X6 => Tout1,
sel_1 => Rsel1, sel_2 => Rsel2, sel_3 => Rsel3, sel_4 => Rsel4, sel_5 => Rsel5, 
sel_6 => Rsel6, sel_7 => Rsel7, sel_8 => Rsel8, sel_9 => Rsel9,
C1 => Rout1, C2 => Rout2, C3 => Rout3, C4 => Rout4, C5 => Rout5, C6 => Rout6);

-- Selection for Shortest Path or main flow
BCU11_X4_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Rout4, Q => B, Sel => Sel_SP, Y => SPout1);
BCU12_X5_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Rout5, Q => B, Sel => Sel_SP, Y => SPout2);
BCU13_X6_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Rout6, Q => B, Sel => Sel_SP, Y => SPout3);

Bottom_Face: entity work.Face_Gen(Behavioral)
Port map (
X1 => Fout6, X2 => Fout5, X3 => Fout4,
X4 => Spout1, X5 => SPout2, X6 => SPout3, 
-- X4 => Rout4, X5 => Rout5, X6 => Rout6,
sel_1 => Bsel1, sel_2 => Bsel2, sel_3 => Bsel3, sel_4 => Bsel4, sel_5 => Bsel5, 
sel_6 => Bsel6, sel_7 => Bsel7, sel_8 => Bsel8, sel_9 => Bsel9,
C1 => Bout1, C2 => Bout2, C3 => Bout3, C4 => Bout4, C5 => Bout5, C6 => Bout6);

Back_Face: entity work.Face_Gen(Behavioral)
Port map (
X1 => Bout1, X2 => Bout2, X3 => Bout3, X4 => Rout3, X5 => Rout2, X6 => Rout1,
sel_1 => Ksel1, sel_2 => Ksel2, sel_3 => Ksel3, sel_4 => Ksel4, sel_5 => Ksel5, 
sel_6 => Ksel6, sel_7 => Ksel7, sel_8 => Ksel8, sel_9 => Ksel9,
C1 => Kout1, C2 => Kout2, C3 => Kout3, C4 => Kout4, C5 => Kout5, C6 => Kout6);

Left_Face: entity work.Face_Gen(Behavioral)
Port map (
X1 => Bout6, X2 => Bout5, X3 => Bout4, X4 => Kout4, X5 => Kout5, X6 => Kout6,
sel_1 => Lsel1, sel_2 => Lsel2, sel_3 => Lsel3, sel_4 => Lsel4, sel_5 => Lsel5, 
sel_6 => Lsel6, sel_7 => Lsel7, sel_8 => Lsel8, sel_9 => Lsel9,
C1 => Lout1, C2 => Lout2, C3 => Lout3, C4 => Lout4, C5 => Lout5, C6 => Lout6);

-- Output Selection
Cout1_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Lout1, Q => Bout1, Sel => Sel_SP, Y => SPout4);
Cout2_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Lout2, Q => Bout2, Sel => Sel_SP, Y => SPout5);
Cout3_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Lout3, Q => Bout3, Sel => Sel_SP, Y => SPout6);
Cout4_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Lout4, Q => Bout4, Sel => Sel_SP, Y => SPout7);
Cout5_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Lout5, Q => Bout5, Sel => Sel_SP, Y => SPout8);
Cout6_Sel: entity work.Mux2x1(Behavioral)
port map(
P => Lout6, Q => Bout6, Sel => Sel_SP, Y => SPout9);

-- Final Face Output/ Shortest Path Output
Cout1 <= SPout4;
Cout2 <= SPout5;
Cout3 <= SPout6;
Cout4 <= SPout7;
Cout5 <= SPout8;
Cout6 <= SPout9;

-- Bottom Output
Bottom1 <= Bout1;
Bottom2 <= Bout2;
Bottom3 <= Bout3;
Bottom4 <= Bout4;
Bottom5 <= Bout5;
Bottom6 <= Bout6;

end Behavioral;
