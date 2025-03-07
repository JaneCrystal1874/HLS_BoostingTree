-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eOg_rom is 
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


architecture rtl of predict_ensemble_eOg_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00001001", 5 => "00001011", 6 => "00001101", 7 => "00001111", 
    8 => "00010001", 9 => "00000000", 10 => "00010011", 11 => "00010101", 
    12 => "00010111", 13 => "00011001", 14 => "00011011", 15 => "00011101", 
    16 => "00011111", 17 => "00100001", 18 => "00100011", 19 => "00100101", 
    20 to 22=> "00000000", 23 => "00100111", 24 => "00101001", 25 => "00101011", 
    26 => "00101101", 27 => "00101111", 28 to 29=> "00000000", 30 => "00110001", 
    31 => "00110011", 32 => "00110101", 33 => "00110111", 34 => "00111001", 
    35 to 44=> "00000000", 45 => "00111011", 46 => "00111101", 47 => "00000000", 
    48 => "00111111", 49 => "01000001", 50 => "01000011", 51 => "01000101", 
    52 => "01000111", 53 => "01001001", 54 => "01001011", 55 => "01001101", 
    56 => "01001111", 57 => "01010001", 58 => "01010011", 59 => "00000000", 
    60 => "01010101", 61 => "01010111", 62 to 63=> "00000000", 64 => "01011001", 
    65 => "01011011", 66 => "00000000", 67 => "01011101", 68 => "01011111", 
    69 => "00000000", 70 => "01100001", 71 => "01100011", 72 => "01100101", 
    73 => "01100111", 74 => "01101001", 75 => "01101011", 76 => "01101101", 
    77 => "00000000", 78 => "01101111", 79 => "01110001", 80 => "00000000", 
    81 => "01110011", 82 => "00000000", 83 => "01110101", 84 to 87=> "00000000", 
    88 => "01110111", 89 => "00000000", 90 => "01111001", 91 to 98=> "00000000", 
    99 => "01111011", 100 => "01111101", 101 => "01111111", 102 => "10000001", 
    103 to 104=> "00000000", 105 => "10000011", 106 => "00000000", 107 => "10000101", 
    108 => "10000111", 109 => "10001001", 110 => "10001011", 111 => "10001101", 
    112 => "10001111", 113 => "10010001", 114 => "10010011", 115 to 118=> "00000000", 
    119 => "10010101", 120 => "10010111", 121 => "10011001", 122 => "10011011", 
    123 to 128=> "00000000", 129 => "10011101", 130 => "10011111", 131 to 134=> "00000000", 
    135 => "10100001", 136 to 137=> "00000000", 138 => "10100011", 139 => "00000000", 
    140 => "10100101", 141 => "00000000", 142 => "10100111", 143 to 151=> "00000000", 
    152 => "10101001", 153 to 155=> "00000000", 156 => "10101011", 157 to 158=> "00000000", 
    159 => "10101101", 160 => "00000000", 161 => "10101111", 162 to 164=> "00000000", 
    165 => "10110001", 166 to 176=> "00000000", 177 => "10110011", 178 to 194=> "00000000" );


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

entity predict_ensemble_eOg is
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

architecture arch of predict_ensemble_eOg is
    component predict_ensemble_eOg_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eOg_rom_U :  component predict_ensemble_eOg_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


