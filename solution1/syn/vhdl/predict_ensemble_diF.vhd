-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_diF_rom is 
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


architecture rtl of predict_ensemble_diF_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 => "00001001", 7 to 8=> "00000000", 
    9 => "00001011", 10 => "00001101", 11 => "00001111", 12 to 14=> "00000000", 
    15 => "00010001", 16 => "00000000", 17 => "00010011", 18 => "00010101", 
    19 to 20=> "00000000", 21 => "00010111", 22 => "00000000", 23 => "00011001", 
    24 to 25=> "00000000", 26 => "00011011", 27 => "00011101", 28 => "00011111", 
    29 => "00100001", 30 to 31=> "00000000", 32 => "00100011", 33 to 34=> "00000000", 
    35 => "00100101", 36 => "00100111", 37 => "00101001", 38 to 39=> "00000000", 
    40 => "00101011", 41 => "00101101", 42 to 44=> "00000000", 45 => "00101111", 
    46 => "00110001", 47 => "00000000", 48 => "00110011", 49 to 50=> "00000000", 
    51 => "00110101", 52 => "00110111", 53 => "00111001", 54 => "00111011", 
    55 => "00111101", 56 to 58=> "00000000", 59 => "00111111", 60 => "01000001", 
    61 to 63=> "00000000", 64 => "01000011", 65 to 66=> "00000000", 67 => "01000101", 
    68 => "01000111", 69 => "01001001", 70 to 71=> "00000000", 72 => "01001011", 
    73 to 75=> "00000000", 76 => "01001101", 77 => "00000000", 78 => "01001111", 
    79 => "01010001", 80 to 81=> "00000000", 82 => "01010011", 83 => "01010101", 
    84 => "00000000", 85 => "01010111", 86 => "00000000", 87 => "01011001", 
    88 => "01011011", 89 => "01011101", 90 => "00000000", 91 => "01011111", 
    92 to 93=> "00000000", 94 => "01100001", 95 => "01100011", 96 to 97=> "00000000", 
    98 => "01100101", 99 => "01100111", 100 => "01101001", 101 to 102=> "00000000", 
    103 => "01101011", 104 => "00000000", 105 => "01101101", 106 to 107=> "00000000", 
    108 => "01101111", 109 => "01110001", 110 => "01110011", 111 to 114=> "00000000", 
    115 => "01110101", 116 => "00000000", 117 => "01110111", 118 => "00000000", 
    119 => "01111001", 120 => "01111011", 121 => "01111101", 122 => "01111111", 
    123 => "00000000", 124 => "10000001", 125 to 128=> "00000000", 129 => "10000011", 
    130 => "10000101", 131 to 132=> "00000000", 133 => "10000111", 134 => "10001001", 
    135 => "10001011", 136 to 138=> "00000000", 139 => "10001101", 140 => "10001111", 
    141 => "10010001", 142 => "10010011", 143 => "10010101", 144 => "10010111", 
    145 => "00000000", 146 => "10011001", 147 => "10011011", 148 => "00000000", 
    149 => "10011101", 150 to 153=> "00000000", 154 => "10011111", 155 to 158=> "00000000", 
    159 => "10100001", 160 => "10100011", 161 => "10100101", 162 => "10100111", 
    163 => "00000000", 164 => "10101001", 165 to 166=> "00000000", 167 => "10101011", 
    168 => "10101101", 169 to 172=> "00000000", 173 => "10101111", 174 to 175=> "00000000", 
    176 => "10110001", 177 => "00000000", 178 => "10110011", 179 => "00000000", 
    180 => "10110101", 181 => "10110111", 182 to 194=> "00000000" );


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

entity predict_ensemble_diF is
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

architecture arch of predict_ensemble_diF is
    component predict_ensemble_diF_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_diF_rom_U :  component predict_ensemble_diF_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


