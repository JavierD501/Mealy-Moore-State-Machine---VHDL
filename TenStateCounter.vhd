----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2020 02:03:36 PM
-- Design Name: 
-- Module Name: TSC - Behavioral
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

entity TSC is
    Port ( UP, Clk, Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           DIR_UP : out STD_LOGIC);
end TSC;

architecture Behavioral of TSC is
---- Declare your signals here
signal NS, PS: std_logic_vector(1 downto 0):="00";

begin
---- D-Flip Flop
process(Clk, Reset)
    begin
        if(Reset = '1') then
            PS <= "00";
        elsif(rising_edge(clk)) then
            PS <= NS;
        end if;
        end process;

--- Combinational Circuit
comb_proc:
process (ps, up)
begin
    case ps is
        when 


DIR_UP <= PS(0);
end Behavioral;
