-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_5jm_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_5jm_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0110", 2 => "1010", 3 => "0011", 4 => "0000", 5 => "1001", 
    6 => "0000", 7 => "0101", 8 => "1000", 9 => "0000", 10 => "1001", 
    11 => "1000", 12 to 14=> "0000", 15 => "0101", 16 => "1011", 17 => "0101", 
    18 => "0000", 19 => "0011", 20 => "0000", 21 => "1000", 22 => "1011", 
    23 to 24=> "0000", 25 => "0001", 26 => "0000", 27 => "1000", 28 => "1001", 
    29 => "0000", 30 => "1001", 31 to 33=> "0000", 34 => "0101", 35 => "1001", 
    36 => "1000", 37 => "0111", 38 => "0011", 39 to 40=> "0000", 41 => "1000", 
    42 => "0001", 43 to 44=> "0000", 45 => "1100", 46 => "0000", 47 => "0101", 
    48 => "1011", 49 => "0000", 50 => "0001", 51 => "0000", 52 => "1011", 
    53 => "0010", 54 => "0100", 55 => "0000", 56 => "0011", 57 => "0000", 
    58 => "1011", 59 to 62=> "0000", 63 => "0111", 64 => "1100", 65 => "0010", 
    66 => "0101", 67 to 69=> "0000", 70 => "1010", 71 => "0000", 72 => "0100", 
    73 => "0000", 74 => "1100", 75 => "0111", 76 => "0000", 77 => "0101", 
    78 => "1000", 79 => "0000", 80 => "0001", 81 => "0101", 82 => "0100", 
    83 => "1100", 84 => "0000", 85 => "1010", 86 => "0111", 87 => "0110", 
    88 to 89=> "0000", 90 => "0101", 91 => "1000", 92 => "1101", 93 => "0101", 
    94 => "0011", 95 => "0000", 96 => "1101", 97 to 102=> "0000", 103 => "0100", 
    104 => "0000", 105 => "1100", 106 => "0101", 107 to 108=> "0000", 109 => "1000", 
    110 => "1100", 111 => "0000", 112 => "0010", 113 => "0000", 114 => "1011", 
    115 => "0000", 116 => "1100", 117 => "0010", 118 => "0000", 119 => "1100", 
    120 to 122=> "0000", 123 => "0101", 124 to 128=> "0000", 129 => "0011", 130 => "1000", 
    131 => "0000", 132 => "1100", 133 => "0000", 134 => "1010", 135 => "0001", 
    136 => "0111", 137 to 138=> "0000", 139 to 140=> "1101", 141 => "0001", 142 to 144=> "0000", 
    145 => "0001", 146 => "0000", 147 => "0001", 148 => "1011", 149 to 150=> "0000", 
    151 => "0001", 152 => "0000", 153 => "1010", 154 to 160=> "0000", 161 => "0010", 
    162 => "0000", 163 => "0010", 164 => "0101", 165 to 168=> "0000", 169 => "1010", 
    170 to 172=> "0000", 173 => "0011", 174 => "0000", 175 => "0001", 176 => "0000", 
    177 => "1101", 178 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

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

entity predict_ensemble_5jm is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_5jm is
    component predict_ensemble_5jm_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_5jm_rom_U :  component predict_ensemble_5jm_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


