-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d6N_rom is 
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


architecture rtl of predict_ensemble_d6N_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 => "00000000", 7 => "00001001", 
    8 => "00001011", 9 => "00001101", 10 => "00001111", 11 => "00000000", 
    12 => "00010001", 13 to 15=> "00000000", 16 => "00010011", 17 => "00010101", 
    18 to 19=> "00000000", 20 => "00010111", 21 => "00011001", 22 => "00011011", 
    23 => "00011101", 24 => "00011111", 25 to 26=> "00000000", 27 => "00100001", 
    28 => "00000000", 29 => "00100011", 30 to 31=> "00000000", 32 => "00100101", 
    33 => "00000000", 34 => "00100111", 35 => "00101001", 36 => "00000000", 
    37 => "00101011", 38 => "00101101", 39 => "00000000", 40 => "00101111", 
    41 => "00000000", 42 => "00110001", 43 => "00000000", 44 => "00110011", 
    45 => "00000000", 46 => "00110101", 47 => "00110111", 48 => "00000000", 
    49 => "00111001", 50 to 51=> "00000000", 52 => "00111011", 53 to 54=> "00000000", 
    55 => "00111101", 56 => "00111111", 57 to 59=> "00000000", 60 => "01000001", 
    61 to 63=> "00000000", 64 => "01000011", 65 => "00000000", 66 => "01000101", 
    67 to 68=> "00000000", 69 => "01000111", 70 => "01001001", 71 => "01001011", 
    72 to 73=> "00000000", 74 => "01001101", 75 => "00000000", 76 => "01001111", 
    77 => "00000000", 78 => "01010001", 79 => "00000000", 80 => "01010011", 
    81 => "01010101", 82 => "01010111", 83 to 85=> "00000000", 86 => "01011001", 
    87 => "01011011", 88 => "01011101", 89 to 91=> "00000000", 92 => "01011111", 
    93 => "00000000", 94 => "01100001", 95 to 96=> "00000000", 97 => "01100011", 
    98 => "00000000", 99 => "01100101", 100 => "01100111", 101 => "01101001", 
    102 => "01101011", 103 to 104=> "00000000", 105 => "01101101", 106 => "01101111", 
    107 to 111=> "00000000", 112 => "01110001", 113 => "01110011", 114 => "00000000", 
    115 => "01110101", 116 => "01110111", 117 to 119=> "00000000", 120 => "01111001", 
    121 => "01111011", 122 => "00000000", 123 => "01111101", 124 => "01111111", 
    125 => "10000001", 126 => "10000011", 127 => "10000101", 128 => "10000111", 
    129 => "00000000", 130 => "10001001", 131 to 134=> "00000000", 135 => "10001011", 
    136 to 139=> "00000000", 140 => "10001101", 141 => "10001111", 142 => "10010001", 
    143 => "10010011", 144 => "10010101", 145 => "10010111", 146 to 148=> "00000000", 
    149 => "10011001", 150 => "00000000", 151 => "10011011", 152 => "10011101", 
    153 => "00000000", 154 => "10011111", 155 => "00000000", 156 => "10100001", 
    157 => "10100011", 158 => "00000000", 159 => "10100101", 160 => "00000000", 
    161 => "10100111", 162 to 165=> "00000000", 166 => "10101001", 167 => "00000000", 
    168 => "10101011", 169 => "10101101", 170 to 171=> "00000000", 172 => "10101111", 
    173 => "10110001", 174 => "00000000", 175 => "10110011", 176 => "00000000", 
    177 => "10110101", 178 to 194=> "00000000" );


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

entity predict_ensemble_d6N is
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

architecture arch of predict_ensemble_d6N is
    component predict_ensemble_d6N_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d6N_rom_U :  component predict_ensemble_d6N_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


