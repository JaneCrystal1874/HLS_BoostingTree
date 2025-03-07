-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eZW_rom is 
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


architecture rtl of predict_ensemble_eZW_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000000", 3 => "00000101", 
    4 => "00000111", 5 => "00001001", 6 => "00001011", 7 => "00000000", 
    8 => "00001101", 9 => "00001111", 10 to 11=> "00000000", 12 => "00010001", 
    13 => "00010011", 14 to 15=> "00000000", 16 => "00010101", 17 => "00010111", 
    18 => "00000000", 19 => "00011001", 20 to 21=> "00000000", 22 => "00011011", 
    23 to 24=> "00000000", 25 => "00011101", 26 => "00011111", 27 => "00100001", 
    28 => "00100011", 29 => "00100101", 30 to 31=> "00000000", 32 => "00100111", 
    33 to 35=> "00000000", 36 => "00101001", 37 => "00000000", 38 => "00101011", 
    39 => "00101101", 40 to 43=> "00000000", 44 => "00101111", 45 => "00000000", 
    46 => "00110001", 47 => "00000000", 48 => "00110011", 49 => "00110101", 
    50 => "00000000", 51 => "00110111", 52 to 53=> "00000000", 54 => "00111001", 
    55 => "00000000", 56 => "00111011", 57 => "00111101", 58 => "00111111", 
    59 => "00000000", 60 => "01000001", 61 => "00000000", 62 => "01000011", 
    63 => "00000000", 64 => "01000101", 65 => "00000000", 66 => "01000111", 
    67 => "01001001", 68 to 69=> "00000000", 70 => "01001011", 71 => "00000000", 
    72 => "01001101", 73 => "01001111", 74 => "01010001", 75 to 76=> "00000000", 
    77 => "01010011", 78 to 81=> "00000000", 82 => "01010101", 83 to 85=> "00000000", 
    86 => "01010111", 87 => "00000000", 88 => "01011001", 89 => "00000000", 
    90 => "01011011", 91 => "00000000", 92 => "01011101", 93 => "01011111", 
    94 => "00000000", 95 => "01100001", 96 => "00000000", 97 => "01100011", 
    98 => "01100101", 99 => "00000000", 100 => "01100111", 101 => "01101001", 
    102 => "01101011", 103 => "01101101", 104 => "00000000", 105 => "01101111", 
    106 to 110=> "00000000", 111 => "01110001", 112 => "00000000", 113 => "01110011", 
    114 to 115=> "00000000", 116 => "01110101", 117 => "01110111", 118 => "01111001", 
    119 to 120=> "00000000", 121 => "01111011", 122 => "01111101", 123 => "01111111", 
    124 => "00000000", 125 => "10000001", 126 to 127=> "00000000", 128 => "10000011", 
    129 => "10000101", 130 => "10000111", 131 => "00000000", 132 => "10001001", 
    133 => "00000000", 134 => "10001011", 135 => "00000000", 136 => "10001101", 
    137 => "00000000", 138 => "10001111", 139 to 143=> "00000000", 144 => "10010001", 
    145 => "10010011", 146 => "10010101", 147 => "10010111", 148 => "10011001", 
    149 to 150=> "00000000", 151 => "10011011", 152 => "00000000", 153 => "10011101", 
    154 => "00000000", 155 => "10011111", 156 => "10100001", 157 to 158=> "00000000", 
    159 => "10100011", 160 to 162=> "00000000", 163 => "10100101", 164 => "00000000", 
    165 => "10100111", 166 => "00000000", 167 => "10101001", 168 to 194=> "00000000" );


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

entity predict_ensemble_eZW is
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

architecture arch of predict_ensemble_eZW is
    component predict_ensemble_eZW_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eZW_rom_U :  component predict_ensemble_eZW_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


