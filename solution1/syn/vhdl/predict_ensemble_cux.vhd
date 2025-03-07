-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cux_rom is 
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


architecture rtl of predict_ensemble_cux_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 to 6=> "00000000", 7 => "00001001", 8 => "00000000", 9 => "00001011", 
    10 => "00001101", 11 => "00001111", 12 to 15=> "00000000", 16 => "00010001", 
    17 => "00000000", 18 => "00010011", 19 => "00010101", 20 to 21=> "00000000", 
    22 => "00010111", 23 => "00011001", 24 => "00011011", 25 => "00011101", 
    26 => "00011111", 27 => "00100001", 28 => "00100011", 29 => "00100101", 
    30 to 34=> "00000000", 35 => "00100111", 36 to 38=> "00000000", 39 => "00101001", 
    40 => "00101011", 41 => "00000000", 42 => "00101101", 43 => "00101111", 
    44 => "00110001", 45 => "00000000", 46 => "00110011", 47 => "00110101", 
    48 to 49=> "00000000", 50 => "00110111", 51 => "00000000", 52 => "00111001", 
    53 to 54=> "00000000", 55 => "00111011", 56 to 57=> "00000000", 58 => "00111101", 
    59 => "00111111", 60 to 62=> "00000000", 63 => "01000001", 64 to 65=> "00000000", 
    66 => "01000011", 67 => "01000101", 68 => "00000000", 69 => "01000111", 
    70 => "01001001", 71 => "01001011", 72 => "01001101", 73 => "01001111", 
    74 to 75=> "00000000", 76 => "01010001", 77 to 78=> "00000000", 79 => "01010011", 
    80 => "00000000", 81 => "01010101", 82 => "00000000", 83 => "01010111", 
    84 => "01011001", 85 => "01011011", 86 => "01011101", 87 => "00000000", 
    88 => "01011111", 89 => "00000000", 90 => "01100001", 91 to 92=> "00000000", 
    93 => "01100011", 94 => "01100101", 95 => "01100111", 96 => "00000000", 
    97 => "01101001", 98 to 102=> "00000000", 103 => "01101011", 104 => "00000000", 
    105 => "01101101", 106 => "01101111", 107 => "01110001", 108 => "01110011", 
    109 => "00000000", 110 => "01110101", 111 to 116=> "00000000", 117 => "01110111", 
    118 => "01111001", 119 => "00000000", 120 => "01111011", 121 => "00000000", 
    122 => "01111101", 123 => "01111111", 124 => "00000000", 125 => "10000001", 
    126 => "10000011", 127 => "00000000", 128 => "10000101", 129 => "10000111", 
    130 => "10001001", 131 to 132=> "00000000", 133 => "10001011", 134 => "00000000", 
    135 => "10001101", 136 to 139=> "00000000", 140 => "10001111", 141 => "10010001", 
    142 => "00000000", 143 => "10010011", 144 => "10010101", 145 => "10010111", 
    146 => "00000000", 147 => "10011001", 148 => "00000000", 149 => "10011011", 
    150 to 151=> "00000000", 152 => "10011101", 153 to 157=> "00000000", 158 => "10011111", 
    159 => "10100001", 160 => "10100011", 161 => "10100101", 162 => "00000000", 
    163 => "10100111", 164 => "10101001", 165 => "10101011", 166 => "10101101", 
    167 to 168=> "00000000", 169 => "10101111", 170 => "10110001", 171 to 174=> "00000000", 
    175 => "10110011", 176 => "10110101", 177 => "10110111", 178 to 180=> "00000000", 
    181 => "10111001", 182 to 183=> "00000000", 184 => "10111011", 185 => "00000000", 
    186 => "10111101", 187 to 194=> "00000000" );


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

entity predict_ensemble_cux is
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

architecture arch of predict_ensemble_cux is
    component predict_ensemble_cux_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cux_rom_U :  component predict_ensemble_cux_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


