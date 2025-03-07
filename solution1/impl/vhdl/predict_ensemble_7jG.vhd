-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_7jG_rom is 
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


architecture rtl of predict_ensemble_7jG_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00000000", 5 => "00001001", 6 => "00000000", 7 => "00001011", 
    8 => "00001101", 9 => "00000000", 10 => "00001111", 11 => "00010001", 
    12 to 14=> "00000000", 15 => "00010011", 16 => "00010101", 17 => "00010111", 
    18 => "00000000", 19 => "00011001", 20 => "00000000", 21 => "00011011", 
    22 => "00011101", 23 to 24=> "00000000", 25 => "00011111", 26 => "00000000", 
    27 => "00100001", 28 => "00100011", 29 => "00000000", 30 => "00100101", 
    31 to 33=> "00000000", 34 => "00100111", 35 => "00101001", 36 => "00101011", 
    37 => "00101101", 38 => "00101111", 39 to 40=> "00000000", 41 => "00110001", 
    42 => "00110011", 43 to 44=> "00000000", 45 => "00110101", 46 => "00000000", 
    47 => "00110111", 48 => "00111001", 49 => "00000000", 50 => "00111011", 
    51 => "00000000", 52 => "00111101", 53 => "00111111", 54 => "01000001", 
    55 => "00000000", 56 => "01000011", 57 => "00000000", 58 => "01000101", 
    59 to 62=> "00000000", 63 => "01000111", 64 => "01001001", 65 => "01001011", 
    66 => "01001101", 67 to 69=> "00000000", 70 => "01001111", 71 => "00000000", 
    72 => "01010001", 73 => "00000000", 74 => "01010011", 75 => "01010101", 
    76 => "00000000", 77 => "01010111", 78 => "01011001", 79 => "00000000", 
    80 => "01011011", 81 => "01011101", 82 => "01011111", 83 => "01100001", 
    84 => "00000000", 85 => "01100011", 86 => "01100101", 87 => "01100111", 
    88 to 89=> "00000000", 90 => "01101001", 91 => "01101011", 92 => "01101101", 
    93 => "01101111", 94 => "01110001", 95 => "00000000", 96 => "01110011", 
    97 to 102=> "00000000", 103 => "01110101", 104 => "00000000", 105 => "01110111", 
    106 => "01111001", 107 to 108=> "00000000", 109 => "01111011", 110 => "01111101", 
    111 => "00000000", 112 => "01111111", 113 => "00000000", 114 => "10000001", 
    115 => "00000000", 116 => "10000011", 117 => "10000101", 118 => "00000000", 
    119 => "10000111", 120 to 122=> "00000000", 123 => "10001001", 124 to 128=> "00000000", 
    129 => "10001011", 130 => "10001101", 131 => "00000000", 132 => "10001111", 
    133 => "00000000", 134 => "10010001", 135 => "10010011", 136 => "10010101", 
    137 to 138=> "00000000", 139 => "10010111", 140 => "10011001", 141 => "10011011", 
    142 to 144=> "00000000", 145 => "10011101", 146 => "00000000", 147 => "10011111", 
    148 => "10100001", 149 to 150=> "00000000", 151 => "10100011", 152 => "00000000", 
    153 => "10100101", 154 to 160=> "00000000", 161 => "10100111", 162 => "00000000", 
    163 => "10101001", 164 => "10101011", 165 to 168=> "00000000", 169 => "10101101", 
    170 to 172=> "00000000", 173 => "10101111", 174 => "00000000", 175 => "10110001", 
    176 => "00000000", 177 => "10110011", 178 to 194=> "00000000" );


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

entity predict_ensemble_7jG is
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

architecture arch of predict_ensemble_7jG is
    component predict_ensemble_7jG_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_7jG_rom_U :  component predict_ensemble_7jG_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


