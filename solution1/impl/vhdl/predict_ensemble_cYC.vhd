-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cYC_rom is 
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


architecture rtl of predict_ensemble_cYC_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 => "00001001", 6 => "00000000", 7 => "00001011", 
    8 => "00001101", 9 to 11=> "00000000", 12 => "00001111", 13 to 14=> "00000000", 
    15 => "00010001", 16 => "00010011", 17 => "00010101", 18 to 19=> "00000000", 
    20 => "00010111", 21 => "00000000", 22 => "00011001", 23 to 24=> "00000000", 
    25 => "00011011", 26 => "00000000", 27 => "00011101", 28 => "00000000", 
    29 => "00011111", 30 => "00100001", 31 to 33=> "00000000", 34 => "00100011", 
    35 => "00100101", 36 => "00000000", 37 => "00100111", 38 => "00000000", 
    39 => "00101001", 40 => "00101011", 41 => "00000000", 42 => "00101101", 
    43 => "00000000", 44 => "00101111", 45 => "00000000", 46 => "00110001", 
    47 => "00110011", 48 to 49=> "00000000", 50 => "00110101", 51 => "00110111", 
    52 => "00000000", 53 => "00111001", 54 => "00000000", 55 => "00111011", 
    56 => "00111101", 57 => "00111111", 58 to 60=> "00000000", 61 => "01000001", 
    62 => "01000011", 63 => "01000101", 64 => "01000111", 65 to 66=> "00000000", 
    67 => "01001001", 68 to 72=> "00000000", 73 => "01001011", 74 => "00000000", 
    75 => "01001101", 76 => "00000000", 77 => "01001111", 78 => "00000000", 
    79 => "01010001", 80 => "00000000", 81 => "01010011", 82 => "01010101", 
    83 => "01010111", 84 => "01011001", 85 => "00000000", 86 => "01011011", 
    87 => "01011101", 88 => "00000000", 89 => "01011111", 90 => "00000000", 
    91 => "01100001", 92 => "01100011", 93 to 96=> "00000000", 97 => "01100101", 
    98 => "00000000", 99 => "01100111", 100 => "01101001", 101 => "01101011", 
    102 => "00000000", 103 => "01101101", 104 => "00000000", 105 => "01101111", 
    106 to 109=> "00000000", 110 => "01110001", 111 => "00000000", 112 => "01110011", 
    113 => "00000000", 114 => "01110101", 115 => "00000000", 116 => "01110111", 
    117 to 119=> "00000000", 120 => "01111001", 121 => "00000000", 122 => "01111011", 
    123 => "00000000", 124 => "01111101", 125 => "01111111", 126 => "10000001", 
    127 => "00000000", 128 => "10000011", 129 => "10000101", 130 => "10000111", 
    131 => "00000000", 132 => "10001001", 133 => "00000000", 134 => "10001011", 
    135 => "10001101", 136 => "10001111", 137 to 138=> "00000000", 139 => "10010001", 
    140 => "10010011", 141 to 142=> "00000000", 143 => "10010101", 144 => "10010111", 
    145 => "00000000", 146 => "10011001", 147 => "10011011", 148 to 150=> "00000000", 
    151 => "10011101", 152 => "00000000", 153 => "10011111", 154 to 156=> "00000000", 
    157 => "10100001", 158 => "00000000", 159 => "10100011", 160 => "00000000", 
    161 => "10100101", 162 => "10100111", 163 to 164=> "00000000", 165 => "10101001", 
    166 => "00000000", 167 => "10101011", 168 => "10101101", 169 to 172=> "00000000", 
    173 => "10101111", 174 => "10110001", 175 => "10110011", 176 to 178=> "00000000", 
    179 => "10110101", 180 => "10110111", 181 to 183=> "00000000", 184 => "10111001", 
    185 to 194=> "00000000" );


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

entity predict_ensemble_cYC is
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

architecture arch of predict_ensemble_cYC is
    component predict_ensemble_cYC_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cYC_rom_U :  component predict_ensemble_cYC_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


