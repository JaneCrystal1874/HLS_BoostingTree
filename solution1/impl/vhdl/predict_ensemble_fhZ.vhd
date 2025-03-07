-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_fhZ_rom is 
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


architecture rtl of predict_ensemble_fhZ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0011", 1 => "0010", 2 => "1010", 3 => "0011", 4 => "0000", 
    5 => "0011", 6 to 7=> "0000", 8 => "0100", 9 => "0101", 10 => "1001", 
    11 to 13=> "0000", 14 => "0111", 15 => "0100", 16 => "1011", 17 => "0000", 
    18 => "0011", 19 to 20=> "0000", 21 => "0111", 22 => "1011", 23 => "0000", 
    24 => "1000", 25 => "0000", 26 => "1011", 27 => "0000", 28 => "1011", 
    29 to 31=> "0000", 32 => "0001", 33 => "0000", 34 => "1011", 35 to 36=> "0000", 
    37 => "0001", 38 => "1011", 39 to 40=> "0000", 41 to 42=> "1011", 43 to 45=> "0000", 
    46 => "0101", 47 => "1010", 48 => "0000", 49 to 50=> "1000", 51 => "0101", 
    52 => "0000", 53 to 55=> "1011", 56 => "0000", 57 => "1011", 58 => "1010", 
    59 => "0000", 60 => "1011", 61 => "1101", 62 to 67=> "0000", 68 => "1000", 
    69 => "0101", 70 => "0000", 71 => "0101", 72 => "1000", 73 => "0000", 
    74 => "1101", 75 to 77=> "0000", 78 => "0111", 79 => "0001", 80 => "1001", 
    81 => "1010", 82 to 83=> "1101", 84 => "0000", 85 => "0101", 86 => "0010", 
    87 => "1011", 88 => "1100", 89 to 90=> "0000", 91 => "0010", 92 to 96=> "0000", 
    97 => "0100", 98 => "1011", 99 => "1100", 100 => "0110", 101 => "0000", 
    102 => "0100", 103 => "0010", 104 => "0111", 105 to 106=> "0000", 107 => "0001", 
    108 to 109=> "0000", 110 to 111=> "0100", 112 => "1101", 113 => "0000", 114 => "0110", 
    115 to 116=> "0000", 117 => "0011", 118 => "0111", 119 => "0110", 120 => "1011", 
    121 => "0000", 122 => "0101", 123 => "0100", 124 => "0000", 125 => "1100", 
    126 => "0000", 127 => "1001", 128 => "0000", 129 => "0010", 130 => "0000", 
    131 => "0101", 132 => "0011", 133 => "0000", 134 => "1101", 135 to 141=> "0000", 
    142 => "1001", 143 to 144=> "0000", 145 => "0100", 146 => "0011", 147 to 148=> "0000", 
    149 => "1010", 150 to 155=> "0000", 156 => "0011", 157 => "0111", 158 => "0010", 
    159 => "0000", 160 => "0101", 161 => "1011", 162 => "0111", 163 to 164=> "0001", 
    165 to 167=> "0000", 168 => "0101", 169 => "0000", 170 => "0100", 171 to 173=> "0000", 
    174 => "1001", 175 => "0000", 176 => "0101", 177 => "1100", 178 => "0000", 
    179 => "0101", 180 => "1000", 181 => "0000", 182 => "0101", 183 to 185=> "0000", 
    186 => "0100", 187 to 194=> "0000" );

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

entity predict_ensemble_fhZ is
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

architecture arch of predict_ensemble_fhZ is
    component predict_ensemble_fhZ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_fhZ_rom_U :  component predict_ensemble_fhZ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


