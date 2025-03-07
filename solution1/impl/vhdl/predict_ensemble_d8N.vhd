-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d8N_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_d8N_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 to 6=> "1", 7 to 8=> "0", 9 to 11=> "1", 12 to 13=> "0", 
    14 => "1", 15 => "0", 16 to 17=> "1", 18 => "0", 19 => "1", 20 => "0", 21 => "1", 
    22 => "0", 23 => "1", 24 to 27=> "0", 28 to 29=> "1", 30 => "0", 31 => "1", 32 => "0", 
    33 => "1", 34 to 35=> "0", 36 => "1", 37 to 38=> "0", 39 => "1", 40 to 41=> "0", 42 to 43=> "1", 
    44 => "0", 45 => "1", 46 => "0", 47 to 48=> "1", 49 to 50=> "0", 51 => "1", 52 to 54=> "0", 
    55 => "1", 56 => "0", 57 => "1", 58 => "0", 59 => "1", 60 => "0", 61 => "1", 
    62 to 63=> "0", 64 to 65=> "1", 66 => "0", 67 to 69=> "1", 70 to 71=> "0", 72 => "1", 73 to 75=> "0", 
    76 to 77=> "1", 78 => "0", 79 => "1", 80 => "0", 81 => "1", 82 => "0", 83 => "1", 
    84 => "0", 85 to 87=> "1", 88 => "0", 89 to 90=> "1", 91 to 92=> "0", 93 => "1", 94 => "0", 
    95 to 99=> "1", 100 => "0", 101 => "1", 102 to 103=> "0", 104 => "1", 105 => "0", 106 to 107=> "1", 
    108 => "0", 109 => "1", 110 => "0", 111 => "1", 112 to 114=> "0", 115 to 117=> "1", 118 to 119=> "0", 
    120 => "1", 121 => "0", 122 => "1", 123 => "0", 124 => "1", 125 => "0", 126 => "1", 
    127 to 129=> "0", 130 to 132=> "1", 133 to 135=> "0", 136 => "1", 137 => "0", 138 to 140=> "1", 141 to 142=> "0", 
    143 => "1", 144 => "0", 145 => "1", 146 => "0", 147 => "1", 148 to 153=> "0", 154 => "1", 
    155 => "0", 156 to 158=> "1", 159 to 161=> "0", 162 to 164=> "1", 165 => "0", 166 to 169=> "1", 170 to 171=> "0", 
    172 to 176=> "1", 177 to 194=> "0" );

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

entity predict_ensemble_d8N is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_d8N is
    component predict_ensemble_d8N_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d8N_rom_U :  component predict_ensemble_d8N_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


