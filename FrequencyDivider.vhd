----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2020 02:13:04 PM
-- Design Name: 
-- Module Name: Clk_Dvider - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FD is
    Port ( Clk, Reset : in STD_LOGIC;
           Slow_Clk : out STD_LOGIC);
end FD;

architecture Behavioral of FD is

signal Count: std_logic_vector (25 downto 0):= (others => '0');
begin

P_Count: process(Clk, Reset)
         begin
         if(Reset='1') then
         Count <= (others => '0');
         elsif(rising_edge(Clk)) then
         Count <= Count + 1;
         end if;
         end process;
         
         Slow_Clk <= Count(25);

end Behavioral;
