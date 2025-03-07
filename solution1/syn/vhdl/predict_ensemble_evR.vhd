-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_evR_rom is 
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


architecture rtl of predict_ensemble_evR_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 => "00001001", 6 => "00000000", 7 => "00001011", 
    8 to 9=> "00000000", 10 => "00001101", 11 => "00000000", 12 => "00001111", 
    13 => "00010001", 14 => "00010011", 15 => "00010101", 16 => "00010111", 
    17 to 23=> "00000000", 24 => "00011001", 25 => "00000000", 26 => "00011011", 
    27 => "00000000", 28 => "00011101", 29 => "00011111", 30 to 31=> "00000000", 
    32 => "00100001", 33 => "00000000", 34 => "00100011", 35 => "00000000", 
    36 => "00100101", 37 => "00100111", 38 => "00101001", 39 => "00101011", 
    40 to 41=> "00000000", 42 => "00101101", 43 => "00101111", 44 => "00110001", 
    45 to 49=> "00000000", 50 => "00110011", 51 => "00110101", 52 to 53=> "00000000", 
    54 => "00110111", 55 => "00111001", 56 => "00111011", 57 => "00111101", 
    58 => "00111111", 59 to 60=> "00000000", 61 => "01000001", 62 to 65=> "00000000", 
    66 => "01000011", 67 => "01000101", 68 => "01000111", 69 to 70=> "00000000", 
    71 => "01001001", 72 => "01001011", 73 => "01001101", 74 => "00000000", 
    75 => "01001111", 76 => "00000000", 77 => "01010001", 78 => "00000000", 
    79 => "01010011", 80 => "00000000", 81 => "01010101", 82 => "01010111", 
    83 => "01011001", 84 to 89=> "00000000", 90 => "01011011", 91 => "01011101", 
    92 => "01011111", 93 => "01100001", 94 => "01100011", 95 => "01100101", 
    96 => "01100111", 97 to 99=> "00000000", 100 => "01101001", 101 => "01101011", 
    102 to 103=> "00000000", 104 => "01101101", 105 to 107=> "00000000", 108 => "01101111", 
    109 => "01110001", 110 => "01110011", 111 => "00000000", 112 => "01110101", 
    113 to 114=> "00000000", 115 => "01110111", 116 to 118=> "00000000", 119 => "01111001", 
    120 => "01111011", 121 => "01111101", 122 => "00000000", 123 => "01111111", 
    124 to 127=> "00000000", 128 => "10000001", 129 => "00000000", 130 => "10000011", 
    131 => "10000101", 132 => "10000111", 133 => "10001001", 134 => "10001011", 
    135 => "00000000", 136 => "10001101", 137 to 140=> "00000000", 141 => "10001111", 
    142 => "10010001", 143 to 144=> "00000000", 145 => "10010011", 146 => "10010101", 
    147 => "00000000", 148 => "10010111", 149 => "10011001", 150 => "00000000", 
    151 => "10011011", 152 to 154=> "00000000", 155 => "10011101", 156 => "10011111", 
    157 to 159=> "00000000", 160 => "10100001", 161 => "00000000", 162 => "10100011", 
    163 => "00000000", 164 => "10100101", 165 to 194=> "00000000" );


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

entity predict_ensemble_evR is
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

architecture arch of predict_ensemble_evR is
    component predict_ensemble_evR_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_evR_rom_U :  component predict_ensemble_evR_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


