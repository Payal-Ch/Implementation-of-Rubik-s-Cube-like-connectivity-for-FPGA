----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 10:56:58 PM
-- Design Name: 
-- Module Name: Mux_16_1 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_16_1 is
--  Port ( );
Port (A : in STD_LOGIC_VECTOR(2 downto 0); -- Input
B : in STD_LOGIC_VECTOR(2 downto 0); -- Input
Y : out std_logic_vector(2 downto 0); -- Output
Sel : in std_logic_vector(3 downto 0) -- Operation Selector
);
end Mux_16_1;

architecture Behavioral of Mux_16_1 is

begin
process(A,B,Sel)
begin
 case(Sel) is
 when "0000" => Y <= A+B;
 
 when "0001" => Y <= A-B;
 
 when "0010" => Y <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),3)); 

 when "0011" => Y <= to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B(1 downto 0))));  

 when "0100" => Y <= to_stdlogicvector(to_bitvector(A) srl to_integer(unsigned(B(1 downto 0)))); 

 when "0101" => Y <= to_stdlogicvector(to_bitvector(A) sla to_integer(unsigned(B(1 downto 0))));
 
 when "0110" => Y <= to_stdlogicvector(to_bitvector(A) sra to_integer(unsigned(B(1 downto 0))));

 when "0111" => Y <= to_stdlogicvector(to_bitvector(A) rol to_integer(unsigned(B(1 downto 0))));
 
 when "1000" => Y <= to_stdlogicvector(to_bitvector(A) ror to_integer(unsigned(B(1 downto 0))));
 
 when "1001" => Y <= A nand B;

 when "1010" => Y <= A nor B;
 
 when "1011" => Y <= A xor B;
 
 when "1100" => Y <= A xnor B;
 
 when "1101" => Y <= A;
 
 when "1110" => Y <= B;
 
 when "1111" => Y <= "000"; --no op

 when others => Y <= "000"; 
 end case;
 end process;

end Behavioral;
