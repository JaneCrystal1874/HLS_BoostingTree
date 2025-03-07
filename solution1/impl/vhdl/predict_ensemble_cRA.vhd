-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cRA_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_cRA_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1100", 1 => "0000", 2 => "0110", 3 => "0101", 4 => "0000", 
    5 => "0101", 6 => "1001", 7 => "1000", 8 => "1100", 9 => "0000", 
    10 => "1011", 11 => "1010", 12 => "1000", 13 to 14=> "0000", 15 => "1011", 
    16 => "0000", 17 => "1000", 18 => "0000", 19 => "1100", 20 => "0000", 
    21 => "1011", 22 to 23=> "0000", 24 => "1010", 25 => "0001", 26 => "1000", 
    27 => "1100", 28 => "0000", 29 => "1010", 30 to 34=> "0000", 35 => "1100", 
    36 => "1010", 37 => "1011", 38 to 39=> "1100", 40 => "0100", 41 to 42=> "0000", 
    43 => "1100", 44 => "0001", 45 to 46=> "0000", 47 => "1000", 48 => "0000", 
    49 => "1010", 50 => "0100", 51 to 53=> "0000", 54 to 55=> "0001", 56 => "0000", 
    57 => "0001", 58 => "1010", 59 => "0000", 60 => "0101", 61 to 62=> "0000", 
    63 => "0001", 64 => "0000", 65 => "0101", 66 => "0001", 67 => "0000", 
    68 => "1101", 69 => "0000", 70 => "0001", 71 to 72=> "0100", 73 => "0101", 
    74 => "1101", 75 => "0000", 76 => "0111", 77 to 78=> "0000", 79 => "0011", 
    80 => "0000", 81 => "0110", 82 to 84=> "0000", 85 => "0100", 86 => "0011", 
    87 to 88=> "0000", 89 => "0111", 90 => "0011", 91 to 92=> "0000", 93 => "1100", 
    94 => "1010", 95 => "0100", 96 => "1101", 97 => "0011", 98 => "0000", 
    99 => "0101", 100 => "0000", 101 => "1100", 102 => "0000", 103 => "0101", 
    104 => "0011", 105 => "1010", 106 => "1100", 107 => "0011", 108 => "0000", 
    109 => "1011", 110 => "1000", 111 to 113=> "0000", 114 => "1001", 115 to 117=> "0000", 
    118 => "1100", 119 to 120=> "0000", 121 => "0111", 122 => "0000", 123 => "0001", 
    124 => "0000", 125 => "0001", 126 to 130=> "0000", 131 => "0100", 132 to 133=> "0101", 
    134 to 135=> "0000", 136 => "0101", 137 to 143=> "0000", 144 => "1000", 145 to 147=> "0000", 
    148 => "0101", 149 => "0000", 150 => "1101", 151 => "0101", 152 => "0100", 
    153 to 154=> "0000", 155 => "0100", 156 => "0000", 157 => "0110", 158 => "0000", 
    159 => "0100", 160 to 161=> "0000", 162 => "0111", 163 => "1000", 164 => "1100", 
    165 => "0000", 166 => "1011", 167 => "0110", 168 => "0000", 169 => "0110", 
    170 => "0000", 171 => "1010", 172 to 173=> "0000", 174 => "0100", 175 to 194=> "0000" );

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

entity predict_ensemble_cRA is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cRA is
    component predict_ensemble_cRA_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cRA_rom_U :  component predict_ensemble_cRA_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


