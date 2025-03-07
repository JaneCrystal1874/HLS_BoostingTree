-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dWL_rom is 
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


architecture rtl of predict_ensemble_dWL_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 to 6=> "00000000", 7 => "00001001", 8 => "00000000", 
    9 => "00001011", 10 => "00001101", 11 => "00001111", 12 => "00000000", 
    13 => "00010001", 14 => "00000000", 15 => "00010011", 16 to 17=> "00000000", 
    18 => "00010101", 19 => "00000000", 20 => "00010111", 21 => "00011001", 
    22 => "00000000", 23 => "00011011", 24 to 25=> "00000000", 26 => "00011101", 
    27 => "00000000", 28 => "00011111", 29 => "00000000", 30 => "00100001", 
    31 => "00000000", 32 => "00100011", 33 => "00000000", 34 => "00100101", 
    35 to 37=> "00000000", 38 => "00100111", 39 => "00101001", 40 to 41=> "00000000", 
    42 => "00101011", 43 => "00101101", 44 => "00000000", 45 => "00101111", 
    46 => "00110001", 47 => "00110011", 48 to 51=> "00000000", 52 => "00110101", 
    53 => "00000000", 54 => "00110111", 55 => "00000000", 56 => "00111001", 
    57 => "00111011", 58 => "00111101", 59 => "00111111", 60 => "00000000", 
    61 => "01000001", 62 => "01000011", 63 => "01000101", 64 => "01000111", 
    65 => "01001001", 66 to 67=> "00000000", 68 => "01001011", 69 to 71=> "00000000", 
    72 => "01001101", 73 => "01001111", 74 => "01010001", 75 => "01010011", 
    76 => "01010101", 77 => "01010111", 78 => "01011001", 79 to 80=> "00000000", 
    81 => "01011011", 82 => "00000000", 83 => "01011101", 84 to 85=> "00000000", 
    86 => "01011111", 87 to 90=> "00000000", 91 => "01100001", 92 => "01100011", 
    93 to 95=> "00000000", 96 => "01100101", 97 => "00000000", 98 => "01100111", 
    99 => "00000000", 100 => "01101001", 101 => "01101011", 102 => "01101101", 
    103 => "01101111", 104 to 105=> "00000000", 106 => "01110001", 107 to 109=> "00000000", 
    110 => "01110011", 111 => "01110101", 112 => "01110111", 113 to 114=> "00000000", 
    115 => "01111001", 116 => "01111011", 117 to 119=> "00000000", 120 => "01111101", 
    121 => "01111111", 122 => "00000000", 123 => "10000001", 124 to 125=> "00000000", 
    126 => "10000011", 127 => "10000101", 128 => "00000000", 129 => "10000111", 
    130 to 131=> "00000000", 132 => "10001001", 133 => "10001011", 134 => "10001101", 
    135 => "00000000", 136 => "10001111", 137 to 138=> "00000000", 139 => "10010001", 
    140 to 141=> "00000000", 142 => "10010011", 143 to 147=> "00000000", 148 => "10010101", 
    149 => "10010111", 150 => "00000000", 151 => "10011001", 152 => "10011011", 
    153 => "10011101", 154 => "10011111", 155 to 156=> "00000000", 157 => "10100001", 
    158 to 160=> "00000000", 161 => "10100011", 162 => "10100101", 163 => "10100111", 
    164 to 165=> "00000000", 166 => "10101001", 167 => "10101011", 168 to 171=> "00000000", 
    172 => "10101101", 173 => "00000000", 174 => "10101111", 175 to 194=> "00000000" );


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

entity predict_ensemble_dWL is
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

architecture arch of predict_ensemble_dWL is
    component predict_ensemble_dWL_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dWL_rom_U :  component predict_ensemble_dWL_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


