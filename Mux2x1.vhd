----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 04:58:48 PM
-- Design Name: 
-- Module Name: Mux2x1 - Behavioral
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

entity Mux2x1 is
--  Port ( );
Port (P : in STD_LOGIC_VECTOR(2 downto 0); -- Input
Q : in STD_LOGIC_VECTOR(2 downto 0); -- Input
Y : out std_logic_vector(2 downto 0); -- Output
Sel : in std_logic -- Selector
);
end Mux2x1;

architecture Behavioral of Mux2x1 is

begin
process(P,Q,Sel)
begin
 case(Sel) is
 when '0' => Y <= P;
 when '1' => Y <= Q;
 when others => Y <= "000"; 
 end case;
 end process;

end Behavioral;
