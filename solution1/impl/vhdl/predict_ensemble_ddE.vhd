-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ddE_rom is 
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


architecture rtl of predict_ensemble_ddE_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 => "00000000", 7 => "00001001", 
    8 => "00001011", 9 to 10=> "00000000", 11 => "00001101", 12 => "00000000", 
    13 => "00001111", 14 to 15=> "00000000", 16 => "00010001", 17 => "00000000", 
    18 => "00010011", 19 => "00010101", 20 => "00010111", 21 to 23=> "00000000", 
    24 => "00011001", 25 => "00000000", 26 => "00011011", 27 => "00000000", 
    28 => "00011101", 29 => "00011111", 30 => "00000000", 31 => "00100001", 
    32 to 33=> "00000000", 34 => "00100011", 35 => "00100101", 36 => "00100111", 
    37 => "00101001", 38 to 39=> "00000000", 40 => "00101011", 41 => "00101101", 
    42 to 43=> "00000000", 44 => "00101111", 45 => "00110001", 46 => "00110011", 
    47 to 50=> "00000000", 51 => "00110101", 52 => "00110111", 53 => "00111001", 
    54 => "00000000", 55 => "00111011", 56 => "00111101", 57 to 60=> "00000000", 
    61 => "00111111", 62 => "00000000", 63 => "01000001", 64 => "01000011", 
    65 => "01000101", 66 to 68=> "00000000", 69 => "01000111", 70 => "00000000", 
    71 => "01001001", 72 => "01001011", 73 => "01001101", 74 => "00000000", 
    75 => "01001111", 76 => "00000000", 77 => "01010001", 78 to 81=> "00000000", 
    82 => "01010011", 83 => "01010101", 84 => "01010111", 85 => "00000000", 
    86 => "01011001", 87 => "01011011", 88 to 89=> "00000000", 90 => "01011101", 
    91 to 92=> "00000000", 93 => "01011111", 94 => "01100001", 95 => "01100011", 
    96 => "00000000", 97 => "01100101", 98 => "00000000", 99 => "01100111", 
    100 => "01101001", 101 => "01101011", 102 => "00000000", 103 => "01101101", 
    104 to 105=> "00000000", 106 => "01101111", 107 to 108=> "00000000", 109 => "01110001", 
    110 => "01110011", 111 to 112=> "00000000", 113 => "01110101", 114 to 115=> "00000000", 
    116 => "01110111", 117 => "01111001", 118 => "01111011", 119 => "00000000", 
    120 => "01111101", 121 => "01111111", 122 to 123=> "00000000", 124 => "10000001", 
    125 => "10000011", 126 to 127=> "00000000", 128 => "10000101", 129 => "10000111", 
    130 => "10001001", 131 to 134=> "00000000", 135 => "10001011", 136 to 137=> "00000000", 
    138 => "10001101", 139 => "10001111", 140 to 141=> "00000000", 142 => "10010001", 
    143 => "10010011", 144 to 145=> "00000000", 146 => "10010101", 147 => "10010111", 
    148 => "10011001", 149 => "00000000", 150 => "10011011", 151 => "00000000", 
    152 => "10011101", 153 to 154=> "00000000", 155 => "10011111", 156 => "10100001", 
    157 to 161=> "00000000", 162 => "10100011", 163 => "10100101", 164 => "10100111", 
    165 => "10101001", 166 to 167=> "00000000", 168 => "10101011", 169 to 171=> "00000000", 
    172 => "10101101", 173 => "00000000", 174 => "10101111", 175 => "00000000", 
    176 => "10110001", 177 => "10110011", 178 => "00000000", 179 => "10110101", 
    180 => "00000000", 181 => "10110111", 182 => "10111001", 183 to 185=> "00000000", 
    186 => "10111011", 187 to 194=> "00000000" );


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

entity predict_ensemble_ddE is
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

architecture arch of predict_ensemble_ddE is
    component predict_ensemble_ddE_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ddE_rom_U :  component predict_ensemble_ddE_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


