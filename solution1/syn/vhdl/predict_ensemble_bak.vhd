-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bak_rom is 
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


architecture rtl of predict_ensemble_bak_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "0000", 2 => "0111", 3 => "0000", 4 => "0110", 
    5 to 6=> "1000", 7 => "1011", 8 => "0000", 9 => "0111", 10 => "0000", 
    11 => "1000", 12 => "1011", 13 => "0000", 14 => "1011", 15 => "0010", 
    16 => "0000", 17 => "1100", 18 => "1010", 19 to 22=> "0000", 23 => "0001", 
    24 => "0000", 25 => "0011", 26 to 28=> "0000", 29 => "1000", 30 => "0111", 
    31 => "0000", 32 => "0010", 33 => "1011", 34 => "1010", 35 to 38=> "0000", 
    39 => "1000", 40 => "0000", 41 => "1011", 42 => "0001", 43 => "1011", 
    44 to 45=> "0000", 46 => "0001", 47 => "0000", 48 => "1000", 49 => "0000", 
    50 => "0101", 51 => "0000", 52 => "1100", 53 => "0001", 54 => "1010", 
    55 to 56=> "0000", 57 => "0100", 58 => "0001", 59 to 60=> "0000", 61 => "0100", 
    62 to 63=> "0000", 64 => "0100", 65 => "1100", 66 => "0000", 67 => "1001", 
    68 => "1010", 69 => "0010", 70 => "1011", 71 => "0000", 72 => "1101", 
    73 to 74=> "0000", 75 => "0010", 76 => "1101", 77 => "0000", 78 => "1011", 
    79 => "1101", 80 => "0000", 81 => "0010", 82 to 83=> "0000", 84 => "0001", 
    85 => "1000", 86 => "0000", 87 => "1000", 88 => "0000", 89 => "0100", 
    90 => "0110", 91 => "0000", 92 => "0001", 93 => "0000", 94 => "1000", 
    95 => "1011", 96 to 98=> "0000", 99 => "0100", 100 => "0101", 101 => "0000", 
    102 => "0111", 103 => "0011", 104 => "1000", 105 to 106=> "0000", 107 => "0011", 
    108 => "0000", 109 => "1100", 110 to 111=> "0000", 112 => "1011", 113 to 114=> "0000", 
    115 => "0010", 116 => "0111", 117 => "1101", 118 to 120=> "0000", 121 to 122=> "1011", 
    123 to 124=> "0000", 125 => "1011", 126 => "0000", 127 => "0001", 128 => "0000", 
    129 => "1010", 130 => "0110", 131 => "0000", 132 => "1101", 133 => "0101", 
    134 => "1010", 135 to 140=> "0000", 141 => "1010", 142 => "0010", 143 => "0000", 
    144 => "1001", 145 => "0100", 146 => "1010", 147 => "0100", 148 => "0110", 
    149 to 151=> "0000", 152 => "0111", 153 to 156=> "0000", 157 => "1101", 158 => "0100", 
    159 => "0001", 160 to 162=> "0000", 163 => "0101", 164 => "1101", 165 => "0000", 
    166 => "1011", 167 => "0000", 168 => "0111", 169 to 170=> "0000", 171 => "1101", 
    172 => "0000", 173 => "0110", 174 => "1100", 175 => "0000", 176 => "0111", 
    177 to 181=> "0000", 182 => "1000", 183 to 185=> "0000", 186 => "1010", 187 to 194=> "0000" );

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

entity predict_ensemble_bak is
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

architecture arch of predict_ensemble_bak is
    component predict_ensemble_bak_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bak_rom_U :  component predict_ensemble_bak_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


