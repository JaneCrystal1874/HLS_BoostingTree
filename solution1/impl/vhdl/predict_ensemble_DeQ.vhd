-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_DeQ_rom is 
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


architecture rtl of predict_ensemble_DeQ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00001011", 
    8 => "00001101", 9 to 10=> "00000000", 11 => "00001111", 12 => "00010001", 
    13 => "00000000", 14 => "00010011", 15 => "00010101", 16 to 18=> "00000000", 
    19 => "00010111", 20 => "00011001", 21 => "00011011", 22 to 24=> "00000000", 
    25 => "00011101", 26 => "00011111", 27 to 28=> "00000000", 29 => "00100001", 
    30 to 31=> "00000000", 32 => "00100011", 33 to 35=> "00000000", 36 => "00100101", 
    37 => "00100111", 38 => "00000000", 39 => "00101001", 40 => "00101011", 
    41 => "00101101", 42 => "00000000", 43 => "00101111", 44 => "00110001", 
    45 => "00110011", 46 to 48=> "00000000", 49 => "00110101", 50 => "00110111", 
    51 to 52=> "00000000", 53 => "00111001", 54 to 55=> "00000000", 56 => "00111011", 
    57 => "00111101", 58 to 59=> "00000000", 60 => "00111111", 61 => "01000001", 
    62 => "00000000", 63 => "01000011", 64 => "01000101", 65 to 67=> "00000000", 
    68 => "01000111", 69 => "01001001", 70 => "01001011", 71 to 73=> "00000000", 
    74 => "01001101", 75 => "01001111", 76 => "01010001", 77 => "01010011", 
    78 to 81=> "00000000", 82 => "01010101", 83 => "00000000", 84 => "01010111", 
    85 => "01011001", 86 => "01011011", 87 => "01011101", 88 => "01011111", 
    89 => "01100001", 90 => "00000000", 91 => "01100011", 92 => "01100101", 
    93 => "00000000", 94 => "01100111", 95 => "01101001", 96 => "01101011", 
    97 => "01101101", 98 to 100=> "00000000", 101 => "01101111", 102 => "00000000", 
    103 => "01110001", 104 => "00000000", 105 => "01110011", 106 to 108=> "00000000", 
    109 => "01110101", 110 to 111=> "00000000", 112 => "01110111", 113 to 115=> "00000000", 
    116 => "01111001", 117 to 118=> "00000000", 119 => "01111011", 120 => "01111101", 
    121 to 125=> "00000000", 126 => "01111111", 127 => "00000000", 128 => "10000001", 
    129 => "10000011", 130 => "10000101", 131 => "00000000", 132 => "10000111", 
    133 => "10001001", 134 to 135=> "00000000", 136 => "10001011", 137 => "10001101", 
    138 => "00000000", 139 => "10001111", 140 => "00000000", 141 => "10010001", 
    142 => "10010011", 143 to 144=> "00000000", 145 => "10010101", 146 => "10010111", 
    147 => "10011001", 148 => "00000000", 149 => "10011011", 150 to 151=> "00000000", 
    152 => "10011101", 153 => "10011111", 154 to 156=> "00000000", 157 => "10100001", 
    158 => "10100011", 159 => "00000000", 160 => "10100101", 161 => "10100111", 
    162 => "10101001", 163 to 168=> "00000000", 169 => "10101011", 170 => "10101101", 
    171 => "10101111", 172 to 174=> "00000000", 175 => "10110001", 176 => "10110011", 
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

entity predict_ensemble_DeQ is
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

architecture arch of predict_ensemble_DeQ is
    component predict_ensemble_DeQ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_DeQ_rom_U :  component predict_ensemble_DeQ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


