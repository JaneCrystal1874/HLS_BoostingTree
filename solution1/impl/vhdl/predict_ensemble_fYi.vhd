-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_fYi_rom is 
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


architecture rtl of predict_ensemble_fYi_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00001010", 5 => "00001100", 6 => "00001110", 7 => "00010000", 
    8 => "00010010", 9 => "00000000", 10 => "00010100", 11 => "00010110", 
    12 => "00011000", 13 => "00011010", 14 => "00011100", 15 => "00011110", 
    16 => "00100000", 17 => "00100010", 18 => "00100100", 19 => "00100110", 
    20 to 22=> "00000000", 23 => "00101000", 24 => "00101010", 25 => "00101100", 
    26 => "00101110", 27 => "00110000", 28 to 29=> "00000000", 30 => "00110010", 
    31 => "00110100", 32 => "00110110", 33 => "00111000", 34 => "00111010", 
    35 to 44=> "00000000", 45 => "00111100", 46 => "00111110", 47 => "00000000", 
    48 => "01000000", 49 => "01000010", 50 => "01000100", 51 => "01000110", 
    52 => "01001000", 53 => "01001010", 54 => "01001100", 55 => "01001110", 
    56 => "01010000", 57 => "01010010", 58 => "01010100", 59 => "00000000", 
    60 => "01010110", 61 => "01011000", 62 to 63=> "00000000", 64 => "01011010", 
    65 => "01011100", 66 => "00000000", 67 => "01011110", 68 => "01100000", 
    69 => "00000000", 70 => "01100010", 71 => "01100100", 72 => "01100110", 
    73 => "01101000", 74 => "01101010", 75 => "01101100", 76 => "01101110", 
    77 => "00000000", 78 => "01110000", 79 => "01110010", 80 => "00000000", 
    81 => "01110100", 82 => "00000000", 83 => "01110110", 84 to 87=> "00000000", 
    88 => "01111000", 89 => "00000000", 90 => "01111010", 91 to 98=> "00000000", 
    99 => "01111100", 100 => "01111110", 101 => "10000000", 102 => "10000010", 
    103 to 104=> "00000000", 105 => "10000100", 106 => "00000000", 107 => "10000110", 
    108 => "10001000", 109 => "10001010", 110 => "10001100", 111 => "10001110", 
    112 => "10010000", 113 => "10010010", 114 => "10010100", 115 to 118=> "00000000", 
    119 => "10010110", 120 => "10011000", 121 => "10011010", 122 => "10011100", 
    123 to 128=> "00000000", 129 => "10011110", 130 => "10100000", 131 to 134=> "00000000", 
    135 => "10100010", 136 to 137=> "00000000", 138 => "10100100", 139 => "00000000", 
    140 => "10100110", 141 => "00000000", 142 => "10101000", 143 to 151=> "00000000", 
    152 => "10101010", 153 to 155=> "00000000", 156 => "10101100", 157 to 158=> "00000000", 
    159 => "10101110", 160 => "00000000", 161 => "10110000", 162 to 164=> "00000000", 
    165 => "10110010", 166 to 176=> "00000000", 177 => "10110100", 178 to 194=> "00000000" );


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

entity predict_ensemble_fYi is
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

architecture arch of predict_ensemble_fYi is
    component predict_ensemble_fYi_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_fYi_rom_U :  component predict_ensemble_fYi_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


