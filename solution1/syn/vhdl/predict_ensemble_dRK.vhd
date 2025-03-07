-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dRK_rom is 
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


architecture rtl of predict_ensemble_dRK_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000000", 3 => "00000101", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00000000", 
    8 => "00001011", 9 => "00001101", 10 to 11=> "00000000", 12 => "00001111", 
    13 => "00000000", 14 => "00010001", 15 => "00010011", 16 to 17=> "00000000", 
    18 => "00010101", 19 => "00010111", 20 to 21=> "00000000", 22 => "00011001", 
    23 to 25=> "00000000", 26 => "00011011", 27 => "00011101", 28 to 29=> "00000000", 
    30 => "00011111", 31 => "00100001", 32 => "00100011", 33 => "00100101", 
    34 => "00100111", 35 => "00101001", 36 to 37=> "00000000", 38 => "00101011", 
    39 to 40=> "00000000", 41 => "00101101", 42 to 43=> "00000000", 44 => "00101111", 
    45 => "00110001", 46 => "00000000", 47 => "00110011", 48 => "00110101", 
    49 => "00110111", 50 => "00111001", 51 => "00111011", 52 to 53=> "00000000", 
    54 => "00111101", 55 => "00111111", 56 => "00000000", 57 => "01000001", 
    58 => "01000011", 59 to 62=> "00000000", 63 => "01000101", 64 => "01000111", 
    65 to 67=> "00000000", 68 => "01001001", 69 => "01001011", 70 => "01001101", 
    71 => "01001111", 72 => "00000000", 73 => "01010001", 74 => "00000000", 
    75 => "01010011", 76 => "01010101", 77 => "00000000", 78 => "01010111", 
    79 to 80=> "00000000", 81 => "01011001", 82 to 84=> "00000000", 85 => "01011011", 
    86 to 87=> "00000000", 88 => "01011101", 89 => "00000000", 90 => "01011111", 
    91 to 93=> "00000000", 94 => "01100001", 95 => "00000000", 96 => "01100011", 
    97 to 98=> "00000000", 99 => "01100101", 100 => "01100111", 101 => "01101001", 
    102 => "00000000", 103 => "01101011", 104 => "01101101", 105 to 106=> "00000000", 
    107 => "01101111", 108 to 109=> "00000000", 110 => "01110001", 111 => "01110011", 
    112 to 114=> "00000000", 115 => "01110101", 116 => "00000000", 117 => "01110111", 
    118 => "00000000", 119 => "01111001", 120 => "01111011", 121 => "00000000", 
    122 => "01111101", 123 => "01111111", 124 => "10000001", 125 => "00000000", 
    126 => "10000011", 127 to 128=> "00000000", 129 => "10000101", 130 to 131=> "00000000", 
    132 => "10000111", 133 => "10001001", 134 => "10001011", 135 => "10001101", 
    136 => "00000000", 137 => "10001111", 138 to 142=> "00000000", 143 => "10010001", 
    144 => "00000000", 145 => "10010011", 146 => "00000000", 147 => "10010101", 
    148 to 149=> "00000000", 150 => "10010111", 151 => "10011001", 152 to 153=> "00000000", 
    154 => "10011011", 155 => "00000000", 156 => "10011101", 157 => "10011111", 
    158 => "10100001", 159 => "10100011", 160 to 162=> "00000000", 163 => "10100101", 
    164 => "10100111", 165 => "10101001", 166 => "10101011", 167 => "00000000", 
    168 => "10101101", 169 => "10101111", 170 to 171=> "00000000", 172 => "10110001", 
    173 to 176=> "00000000", 177 => "10110011", 178 to 194=> "00000000" );


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

entity predict_ensemble_dRK is
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

architecture arch of predict_ensemble_dRK is
    component predict_ensemble_dRK_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dRK_rom_U :  component predict_ensemble_dRK_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


