-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cQA_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_cQA_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 3=> "0", 4 => "1", 5 to 8=> "0", 9 => "1", 10 to 12=> "0", 
    13 to 14=> "1", 15 => "0", 16 => "1", 17 => "0", 18 => "1", 19 => "0", 20 => "1", 
    21 => "0", 22 to 23=> "1", 24 to 27=> "0", 28 => "1", 29 => "0", 30 to 34=> "1", 35 to 40=> "0", 
    41 to 42=> "1", 43 to 44=> "0", 45 to 46=> "1", 47 => "0", 48 => "1", 49 to 50=> "0", 51 to 53=> "1", 
    54 to 55=> "0", 56 => "1", 57 to 58=> "0", 59 => "1", 60 => "0", 61 to 62=> "1", 63 => "0", 
    64 => "1", 65 to 66=> "0", 67 => "1", 68 => "0", 69 => "1", 70 to 74=> "0", 75 => "1", 
    76 => "0", 77 to 78=> "1", 79 => "0", 80 => "1", 81 => "0", 82 to 84=> "1", 85 to 86=> "0", 
    87 to 88=> "1", 89 to 90=> "0", 91 to 92=> "1", 93 to 97=> "0", 98 => "1", 99 => "0", 100 => "1", 
    101 => "0", 102 => "1", 103 to 107=> "0", 108 => "1", 109 to 110=> "0", 111 to 113=> "1", 114 => "0", 
    115 to 117=> "1", 118 => "0", 119 to 120=> "1", 121 => "0", 122 => "1", 123 => "0", 124 => "1", 
    125 => "0", 126 to 130=> "1", 131 to 133=> "0", 134 to 135=> "1", 136 => "0", 137 to 143=> "1", 144 => "0", 
    145 to 147=> "1", 148 => "0", 149 => "1", 150 to 152=> "0", 153 to 154=> "1", 155 => "0", 156 => "1", 
    157 => "0", 158 => "1", 159 => "0", 160 to 161=> "1", 162 to 164=> "0", 165 => "1", 166 to 167=> "0", 
    168 => "1", 169 => "0", 170 => "1", 171 => "0", 172 to 173=> "1", 174 => "0", 175 to 180=> "1", 
    181 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_cQA is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cQA is
    component predict_ensemble_cQA_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cQA_rom_U :  component predict_ensemble_cQA_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


