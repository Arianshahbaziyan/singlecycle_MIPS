library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity memory is
  port (address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
	MemWrite, MemRead,ck: in STD_LOGIC;
	fibsqu  : out STD_LOGIC_VECTOR (31 downto 0);
	read_data: out STD_LOGIC_VECTOR (31 downto 0));
end memory;


architecture behavioral of memory is	  

type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
signal data_mem: mem_array := (
        "00000000000000000000000000000001", -- $zero
        "00000000000000000000000000000001", -- mem 1
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- mem 10 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", -- mem 20
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- mem 30
        "00000000000000000000000000000000"
    );


begin
read_data <= data_mem(conv_integer(address(6 downto 2))) when MemRead = '1' else X"00000000";
mem_process: process(address, write_data,ck)
begin
	if ck = '0' and ck'event then
		if (MemWrite = '1') then
			data_mem(conv_integer(address(6 downto 2))) <= write_data;
			fibsqu <= write_data;
		end if;
	end if;
end process mem_process;

end behavioral;