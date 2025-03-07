-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_2iS_rom is 
    generic(
             DWIDTH     : integer := 8; 
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


architecture rtl of predict_ensemble_2iS_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 to 4=> "00000000", 
    5 => "00000111", 6 => "00001001", 7 to 9=> "00000000", 10 => "00001011", 
    11 => "00001101", 12 => "00001111", 13 to 15=> "00000000", 16 => "00010001", 
    17 => "00010011", 18 => "00010101", 19 to 21=> "00000000", 22 => "00010111", 
    23 => "00011001", 24 => "00000000", 25 => "00011011", 26 => "00011101", 
    27 => "00011111", 28 => "00000000", 29 => "00100001", 30 => "00100011", 
    31 => "00100101", 32 => "00100111", 33 to 35=> "00000000", 36 => "00101001", 
    37 => "00101011", 38 => "00101101", 39 to 40=> "00000000", 41 => "00101111", 
    42 => "00110001", 43 => "00000000", 44 => "00110011", 45 => "00110101", 
    46 => "00000000", 47 => "00110111", 48 to 49=> "00000000", 50 => "00111001", 
    51 => "00111011", 52 => "00111101", 53 to 56=> "00000000", 57 => "00111111", 
    58 to 59=> "00000000", 60 => "01000001", 61 => "01000011", 62 => "00000000", 
    63 => "01000101", 64 to 65=> "00000000", 66 => "01000111", 67 => "01001001", 
    68 => "01001011", 69 => "01001101", 70 => "01001111", 71 => "01010001", 
    72 => "00000000", 73 => "01010011", 74 => "01010101", 75 => "00000000", 
    76 => "01010111", 77 => "01011001", 78 to 85=> "00000000", 86 => "01011011", 
    87 => "00000000", 88 => "01011101", 89 => "01011111", 90 => "01100001", 
    91 => "00000000", 92 => "01100011", 93 to 94=> "00000000", 95 => "01100101", 
    96 => "00000000", 97 => "01100111", 98 => "00000000", 99 => "01101001", 
    100 => "01101011", 101 => "00000000", 102 => "01101101", 103 => "00000000", 
    104 => "01101111", 105 => "00000000", 106 => "01110001", 107 => "01110011", 
    108 => "00000000", 109 => "01110101", 110 => "00000000", 111 => "01110111", 
    112 => "01111001", 113 to 118=> "00000000", 119 => "01111011", 120 to 122=> "00000000", 
    123 => "01111101", 124 => "01111111", 125 => "00000000", 126 => "10000001", 
    127 => "00000000", 128 => "10000011", 129 to 131=> "00000000", 132 => "10000101", 
    133 => "10000111", 134 => "10001001", 135 to 136=> "00000000", 137 => "10001011", 
    138 => "10001101", 139 => "10001111", 140 => "10010001", 141 => "10010011", 
    142 => "10010101", 143 => "00000000", 144 => "10010111", 145 => "00000000", 
    146 => "10011001", 147 => "10011011", 148 to 150=> "00000000", 151 => "10011101", 
    152 => "10011111", 153 => "00000000", 154 => "10100001", 155 to 158=> "00000000", 
    159 => "10100011", 160 to 161=> "00000000", 162 => "10100101", 163 => "10100111", 
    164 => "10101001", 165 to 168=> "00000000", 169 => "10101011", 170 => "10101101", 
    171 => "00000000", 172 => "10101111", 173 => "10110001", 174 => "10110011", 
    175 to 176=> "00000000", 177 => "10110101", 178 to 194=> "00000000" );


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

entity predict_ensemble_2iS is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_2iS is
    component predict_ensemble_2iS_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_2iS_rom_U :  component predict_ensemble_2iS_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


