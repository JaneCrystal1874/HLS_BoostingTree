-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cxx_rom is 
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


architecture rtl of predict_ensemble_cxx_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0000", 4 => "0111", 
    5 => "0000", 6 => "1010", 7 => "1011", 8 => "0000", 9 => "0111", 
    10 => "1011", 11 to 13=> "0000", 14 => "0111", 15 => "0000", 16 to 17=> "1010", 
    18 => "0000", 19 => "1010", 20 => "0000", 21 => "0101", 22 => "0000", 
    23 => "1101", 24 => "1010", 25 => "0010", 26 => "0011", 27 to 28=> "0000", 
    29 => "1101", 30 to 31=> "0000", 32 => "1101", 33 => "1000", 34 => "0000", 
    35 => "0101", 36 => "0010", 37 to 41=> "0000", 42 => "1010", 43 => "1100", 
    44 to 45=> "0000", 46 => "0101", 47 => "0001", 48 => "0000", 49 => "1010", 
    50 => "0100", 51 => "1100", 52 to 53=> "0000", 54 => "0001", 55 => "1010", 
    56 => "1011", 57 => "0101", 58 to 59=> "0111", 60 => "0101", 61 to 63=> "0000", 
    64 => "0010", 65 => "0000", 66 => "1100", 67 to 71=> "0000", 72 to 73=> "1101", 
    74 => "0000", 75 => "1101", 76 => "0000", 77 => "1010", 78 to 80=> "0000", 
    81 => "1011", 82 => "0000", 83 to 84=> "1101", 85 => "0000", 86 => "0001", 
    87 => "0100", 88 => "0101", 89 to 90=> "0000", 91 => "0100", 92 to 94=> "0000", 
    95 => "1011", 96 to 97=> "0000", 98 => "1001", 99 => "0100", 100 => "1001", 
    101 => "1000", 102 to 103=> "0000", 104 => "0111", 105 => "0000", 106 => "1011", 
    107 => "1000", 108 => "1010", 109 to 112=> "0000", 113 => "0110", 114 to 115=> "0000", 
    116 => "1000", 117 => "1011", 118 => "0000", 119 => "1101", 120 => "1011", 
    121 => "0101", 122 to 123=> "0000", 124 => "1011", 125 to 126=> "0000", 127 => "0110", 
    128 => "1011", 129 => "0000", 130 to 131=> "0101", 132 => "1010", 133 to 136=> "0000", 
    137 => "0111", 138 => "0100", 139 => "1100", 140 => "1010", 141 => "0000", 
    142 => "0111", 143 to 146=> "0000", 147 => "0011", 148 => "0110", 149 => "0101", 
    150 => "0011", 151 => "0000", 152 => "0111", 153 to 155=> "0000", 156 => "1001", 
    157 => "0100", 158 to 159=> "0000", 160 => "0110", 161 to 162=> "0111", 163 => "0011", 
    164 => "0100", 165 => "0010", 166 => "1100", 167 => "0101", 168 to 169=> "0000", 
    170 => "1001", 171 to 173=> "0000", 174 => "0110", 175 => "0000", 176 => "0111", 
    177 to 179=> "0000", 180 => "1001", 181 to 184=> "0000", 185 => "0001", 186 => "1001", 
    187 to 194=> "0000" );

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

entity predict_ensemble_cxx is
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

architecture arch of predict_ensemble_cxx is
    component predict_ensemble_cxx_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cxx_rom_U :  component predict_ensemble_cxx_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


