-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_fcY_rom is 
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


architecture rtl of predict_ensemble_fcY_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "1010", 2 => "1011", 3 => "1010", 4 => "0000", 
    5 => "1010", 6 => "1011", 7 to 8=> "1010", 9 to 11=> "0000", 12 => "0011", 
    13 => "0101", 14 => "0000", 15 => "1000", 16 => "1011", 17 => "0000", 
    18 => "1001", 19 => "1100", 20 => "0000", 21 => "0111", 22 => "0100", 
    23 => "0000", 24 to 25=> "0011", 26 => "0000", 27 => "0111", 28 => "0000", 
    29 => "1000", 30 => "0000", 31 => "0100", 32 => "0010", 33 => "0011", 
    34 => "0111", 35 => "0011", 36 => "1001", 37 => "1011", 38 => "1100", 
    39 => "0101", 40 to 43=> "0000", 44 => "1000", 45 => "0000", 46 => "0100", 
    47 => "0000", 48 => "0001", 49 => "0011", 50 => "0001", 51 => "1100", 
    52 => "1001", 53 => "0000", 54 => "0111", 55 => "0100", 56 => "0000", 
    57 => "1001", 58 => "0001", 59 to 60=> "0000", 61 => "1011", 62 => "0001", 
    63 => "0100", 64 => "0010", 65 => "0111", 66 to 70=> "0000", 71 => "1001", 
    72 => "0000", 73 => "0001", 74 => "0101", 75 to 76=> "0000", 77 => "0111", 
    78 to 83=> "0000", 84 to 85=> "1000", 86 => "0110", 87 => "0000", 88 => "0111", 
    89 => "1100", 90 => "0000", 91 => "1011", 92 to 93=> "0000", 94 => "0101", 
    95 to 96=> "1001", 97 => "0000", 98 => "0011", 99 to 104=> "0000", 105 => "0100", 
    106 => "0111", 107 to 108=> "0000", 109 => "0101", 110 => "0011", 111 to 113=> "0000", 
    114 => "0101", 115 => "0111", 116 => "0001", 117 to 121=> "0000", 122 => "1100", 
    123 => "1001", 124 => "0011", 125 => "0000", 126 => "0011", 127 => "1011", 
    128 to 133=> "0000", 134 => "0010", 135 to 136=> "0000", 137 => "0111", 138 to 139=> "0000", 
    140 => "1010", 141 => "0101", 142 => "1010", 143 to 148=> "0000", 149 => "1000", 
    150 => "0000", 151 => "1101", 152 to 154=> "0000", 155 => "0011", 156 => "0000", 
    157 => "0011", 158 => "0100", 159 => "0110", 160 to 161=> "0000", 162 => "0010", 
    163 to 164=> "1001", 165 to 166=> "0000", 167 => "1100", 168 => "1011", 169 to 171=> "0000", 
    172 => "1001", 173 => "0000", 174 => "1011", 175 to 194=> "0000" );

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

entity predict_ensemble_fcY is
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

architecture arch of predict_ensemble_fcY is
    component predict_ensemble_fcY_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_fcY_rom_U :  component predict_ensemble_fcY_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


