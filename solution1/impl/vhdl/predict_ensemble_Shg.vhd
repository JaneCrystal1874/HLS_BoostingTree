-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Shg_rom is 
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


architecture rtl of predict_ensemble_Shg_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00000000", 5 => "00001001", 6 => "00001011", 7 => "00000000", 
    8 => "00001101", 9 to 13=> "00000000", 14 => "00001111", 15 => "00010001", 
    16 => "00000000", 17 => "00010011", 18 => "00000000", 19 => "00010101", 
    20 => "00010111", 21 => "00000000", 22 => "00011001", 23 => "00000000", 
    24 => "00011011", 25 to 27=> "00000000", 28 => "00011101", 29 => "00011111", 
    30 => "00100001", 31 to 33=> "00000000", 34 => "00100011", 35 => "00100101", 
    36 => "00100111", 37 to 38=> "00000000", 39 => "00101001", 40 => "00101011", 
    41 => "00101101", 42 => "00000000", 43 => "00101111", 44 => "00110001", 
    45 => "00110011", 46 => "00000000", 47 => "00110101", 48 => "00000000", 
    49 => "00110111", 50 => "00111001", 51 to 52=> "00000000", 53 => "00111011", 
    54 to 56=> "00000000", 57 => "00111101", 58 => "00111111", 59 to 60=> "00000000", 
    61 => "01000001", 62 to 64=> "00000000", 65 => "01000011", 66 => "01000101", 
    67 => "01000111", 68 to 69=> "00000000", 70 => "01001001", 71 => "01001011", 
    72 => "01001101", 73 => "01001111", 74 => "01010001", 75 => "01010011", 
    76 to 77=> "00000000", 78 => "01010101", 79 => "01010111", 80 to 81=> "00000000", 
    82 => "01011001", 83 => "00000000", 84 => "01011011", 85 to 88=> "00000000", 
    89 => "01011101", 90 => "01011111", 91 => "01100001", 92 => "01100011", 
    93 to 94=> "00000000", 95 => "01100101", 96 => "01100111", 97 to 98=> "00000000", 
    99 => "01101001", 100 => "00000000", 101 => "01101011", 102 to 106=> "00000000", 
    107 => "01101101", 108 => "01101111", 109 => "00000000", 110 => "01110001", 
    111 => "01110011", 112 => "01110101", 113 to 115=> "00000000", 116 => "01110111", 
    117 => "01111001", 118 => "01111011", 119 => "00000000", 120 => "01111101", 
    121 to 122=> "00000000", 123 => "01111111", 124 => "00000000", 125 => "10000001", 
    126 => "10000011", 127 => "10000101", 128 => "10000111", 129 to 131=> "00000000", 
    132 => "10001001", 133 => "10001011", 134 => "10001101", 135 to 139=> "00000000", 
    140 => "10001111", 141 => "10010001", 142 => "10010011", 143 => "10010101", 
    144 => "10010111", 145 => "10011001", 146 => "10011011", 147 => "00000000", 
    148 => "10011101", 149 => "00000000", 150 => "10011111", 151 => "10100001", 
    152 => "00000000", 153 => "10100011", 154 => "10100101", 155 => "00000000", 
    156 => "10100111", 157 to 160=> "00000000", 161 => "10101001", 162 to 167=> "00000000", 
    168 => "10101011", 169 to 170=> "00000000", 171 => "10101101", 172 => "10101111", 
    173 => "00000000", 174 => "10110001", 175 => "00000000", 176 => "10110011", 
    177 to 194=> "00000000" );


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

entity predict_ensemble_Shg is
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

architecture arch of predict_ensemble_Shg is
    component predict_ensemble_Shg_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Shg_rom_U :  component predict_ensemble_Shg_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


